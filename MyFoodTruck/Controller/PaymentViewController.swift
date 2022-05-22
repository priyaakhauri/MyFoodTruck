//
//  PaymentViewController.swift
//  MyFoodTruck
//
//  Created by Vishal Jaiswal on 21/5/22.
//

import Foundation
import UIKit

class PaymentViewController: UIViewController {


    var cartItems = Array<Product>();
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    @IBAction func onProceedClick(_ sender: Any) {
        // Add order in the history   
        let story = UIStoryboard(name: "Main", bundle: nil);
             let orderConfirmationViewController = story.instantiateViewController(identifier: "orderConfirmationViewController") as! OrderConfirmationViewController;
             self.present(orderConfirmationViewController, animated: true, completion: nil);
    }
  
    
}


