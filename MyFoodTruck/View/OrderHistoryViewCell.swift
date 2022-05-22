//
//  OrderHistoryViewCell.swift
//  MyFoodTruck
//
//  Created by Vishal Jaiswal on 21/5/22.
//

import UIKit

class OrderHistoryViewCell: UITableViewCell {

    @IBOutlet weak var lblProductName: UILabel!
    @IBOutlet weak var lblAmount: UILabel!
    var rowIndex = -1;
    var parent: UIViewController? = nil;
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    @IBAction func onRepeatClick(_ sender: Any) {
        let order = Utility().getOrderHistoryByIndex(index: rowIndex);
        // push to cart
        Cart().addToCart(productArr: order);
        // navigate to the cart
        let story = UIStoryboard(name: "Main", bundle: nil);
        let cartViewController = story.instantiateViewController(identifier: "productCartViewController") as! ProductCartViewController;
        self.parent!.present(cartViewController, animated: true, completion: nil);
        
    }
    
    
    func setup(products: Array<Product>, rowIndex: Int,parent: Any) {
        self.rowIndex = rowIndex;
        var productsName = "";
        var totalPrice = 0.0;
        for product in products {
            productsName += product.name + ",";
            totalPrice += Double(product.qty) * product.price;
        }
        
        lblProductName.text = productsName;
        lblAmount.text = String(totalPrice);
        
        self.parent = parent as? UIViewController;
    }

}
