//
//  ProductViewCell.swift
//  MyFoodTruck
//
//  Created by Vishal Jaiswal on 21/5/22.
//

import UIKit

class ProductViewCell: UITableViewCell {
    
    @IBOutlet weak var imgViewProduct: UIImageView!
    @IBOutlet weak var lblProductName: UILabel!
    @IBOutlet weak var btnDecrement: UIButton!
    @IBOutlet weak var btnIncrement: UIButton!
    @IBOutlet weak var lblQty: UILabel!
    
    var cartLabel: UILabel? = nil;
    
    var currentProduct:Product = Product(id: 0, qty: 0);
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func setup(product: Product, cartItem: Array<Product>, cartLabel: UILabel){
        imgViewProduct.image = UIImage(named: product.imgSrc);
        lblProductName.text = product.name;
        lblQty.text = String(product.qty);
        self.currentProduct = product;
        setQty(product:currentProduct,cartItems: cartItem);
        self.cartLabel = cartLabel;
    }
    
    @IBAction func onDecrementClick(_ sender: Any) {
        if(lblQty.text == "0"){
            return
        }
        let qty = Int(lblQty.text!)! - 1;
        self.currentProduct.qty = qty;
        lblQty.text = String(qty);
        Cart().addToCart(product: self.currentProduct);
        if(Int(lblQty.text!) == 0){
            Cart().removeProduct(product: self.currentProduct);
        }
        cartLabel!.text = String(Cart().calculateTotalAmount().totalQty);
    }
    
    @IBAction func onIncrementClick(_ sender: Any) {
        let qty = Int(lblQty.text!)! + 1;
        self.currentProduct.qty = qty;
        lblQty.text = String(qty);
        
        // If qty > 0 then add to cart
        if(qty > 0){
            Cart().addToCart(product: self.currentProduct);
        }
        cartLabel!.text = String(Cart().calculateTotalAmount().totalQty);
    }
    
    func setQty(product: Product, cartItems: Array<Product>){
        
        for item in cartItems {
            if(product.id == item.id){
                lblQty.text = String(item.qty);
            }
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let bottomSpace: CGFloat = 10.0;
        self.contentView.frame = self.contentView.frame.inset(by: UIEdgeInsets(top: 10.0, left: 0, bottom: bottomSpace, right: 0))
    }
    
}
