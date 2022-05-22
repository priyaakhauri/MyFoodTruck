//
//  UserOrderHistoryViewController.swift
//  MyFoodTruck
//
//  Created by Vishal Jaiswal on 21/5/22.
//

import Foundation
import UIKit

class UserOrderHistoryViewController: UIViewController {
    @IBOutlet weak var tvOrderHistory: UITableView!
    var orderHistory = Utility().getOrderHistory();
    override func viewDidLoad() {
        super.viewDidLoad();
        tvOrderHistory.delegate = self;
        tvOrderHistory.dataSource = self;
    }
}


// Table view Delegate extension
extension UserOrderHistoryViewController: UITableViewDelegate{}

// Table view Data source extension
extension UserOrderHistoryViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return orderHistory.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        // assigning data to cells
        let cell = tvOrderHistory.dequeueReusableCell(withIdentifier: "orderHistoryViewCell", for: indexPath) as! OrderHistoryViewCell
        cell.setup(products: orderHistory[indexPath.row], rowIndex: indexPath.row);
        return cell;
    }
}

