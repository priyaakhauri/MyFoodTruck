//
//  OrderConfirmationViewController.swift
//  MyFoodTruck
//
//  Created by Vishal Jaiswal on 21/5/22.
//

import Foundation
import UIKit

class OrderConfirmationViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Utility().saveOrderHistory(products: Cart().getCartItems());
        // Clear cart
        Cart().clearCart();
    }
}
