//
//  HomeViewController.swift
//  MyFoodTruck
//
//  Created by Chetan Chouhan on 11/5/2022.
//


import UIKit

class HomeViewController: UIViewController {

//
//    @IBOutlet weak var leading: NSLayoutConstraint!
//    @IBOutlet weak var trailing: NSLayoutConstraint!
//
    var menuOut = false
    
    @IBOutlet weak var cartValueLabel: UILabel!
    @IBOutlet weak var tvMenu: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tvMenu.delegate = self;
        tvMenu.dataSource = self;
    
    }
}


// Table view Delegate extension
extension HomeViewController: UITableViewDelegate{}

// Table view Data source extension
extension HomeViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return Param.products.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        // assigning data to cells
        let cell = tvMenu.dequeueReusableCell(withIdentifier: "productViewCell", for: indexPath) as! ProductViewCell
        cell.setup(product: Param.products[indexPath.row]);
        return cell;
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let screenSize: CGRect = UIScreen.main.bounds
        let cellHeight = 0.12*screenSize.height;
        return cellHeight;
    }
}


