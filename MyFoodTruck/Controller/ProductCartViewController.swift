//
//  CartViewController.swift
//  MyFoodTruck
//
//  Created by Vishal Jaiswal on 21/5/22.
//

import Foundation
import UIKit

class ProductCartViewController: UIViewController {

//    @IBOutlet weak var tvCart: UITableView!
//    @IBOutlet weak var lblTotalAmount: UILabel!
    
    @IBOutlet weak var lblTotalAmount: UILabel!
    @IBOutlet weak var tvCart: UITableView!
    
    var cartItems = Array<Product>();
    override func viewDidLoad() {
        super.viewDidLoad()
        tvCart.delegate = self;
        tvCart.dataSource = self;
        
        let cart = Cart();
        self.cartItems = cart.getCartItems();
        lblTotalAmount.text = String(cart.calculateTotalAmount().totalAmount);
    }
    
    @IBAction func onCheckoutClick(_ sender: Any) {
                let story = UIStoryboard(name: "Main", bundle: nil);
                let paymentViewController = story.instantiateViewController(identifier: "paymentViewController") as! PaymentViewController;
                self.present(paymentViewController, animated: true, completion: nil);
    }
}


// Table view Delegate extension
extension ProductCartViewController: UITableViewDelegate{}

// Table view Data source extension
extension ProductCartViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return cartItems.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        // assigning data to cells
        let cell = tvCart.dequeueReusableCell(withIdentifier: "cartItemViewCell", for: indexPath) as! CartItemViewCell
        cell.setup(product: cartItems[indexPath.row]);
        return cell;
    }
}

