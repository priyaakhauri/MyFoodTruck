//
//  CartItemViewCell.swift
//  MyFoodTruck
//
//  Created by Vishal Jaiswal on 21/5/22.
//

import UIKit

class CartItemViewCell: UITableViewCell {
    
    @IBOutlet weak var imgViewProduct: UIImageView!
    @IBOutlet weak var lblProductName: UILabel!
    @IBOutlet weak var lblProductQty: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func setup(product: Product) {
        imageView?.image = UIImage(named: product.imgSrc);
        lblProductName.text = product.name;
        lblProductQty.text = String(product.qty);
        lblPrice.text = "$" + String(Double(product.qty) * product.price);
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let bottomSpace: CGFloat = 20.0;
        self.contentView.frame = self.contentView.frame.inset(by: UIEdgeInsets(top: 0, left: 0, bottom: bottomSpace, right: 0))
    }
}
