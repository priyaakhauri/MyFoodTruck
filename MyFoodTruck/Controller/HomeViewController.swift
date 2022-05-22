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
    
    @IBOutlet weak var lblBurgerQty: UILabel!
    
    @IBOutlet weak var lblMCheeseQty: UILabel!
    @IBOutlet weak var lblFChickenQty: UILabel!
    @IBOutlet weak var lblNachosQty: UILabel!
    
    let story = UIStoryboard(name: "Main", bundle: nil);
    let utility = Utility();
    let cart = Cart();
    let cartItems = Cart().getCartItems();
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tvMenu.delegate = self;
        tvMenu.dataSource = self;
        
        setQty();
        
    }
    @IBAction func onOrderHistoryClick(_ sender: Any) {
        let userOrderHistoryViewController = story.instantiateViewController(identifier: "userOrderHistoryViewController") as! UserOrderHistoryViewController;
        self.present(userOrderHistoryViewController, animated: true, completion: nil);
        
    }
    
    @IBAction func onCartClick(_ sender: Any) {
        let cartViewController = story.instantiateViewController(identifier: "productCartViewController") as! ProductCartViewController;
        self.present(cartViewController, animated: true, completion: nil);
    }
    
    
    @IBAction func onBugerIncrement(_ sender: Any) {
        for product in Param.products{
            if(product.id == 2){
                let qty = Int(lblBurgerQty.text!)! + 1;
                lblBurgerQty.text = String(qty);
                var item = product;
                item.qty = qty;
                
                // If qty > 0 then add to cart
                if(qty > 0){
                    cart.addToCart(product: item);
                    return;
                }
            }
        }
    }
    
    @IBAction func onBurgerDecrement(_ sender: Any) {
        for product in Param.products{
            if(product.id == 2){
                let qty = Int(lblBurgerQty.text!)! - 1;
                lblBurgerQty.text = String(qty);
                var item = product;
                item.qty = qty;
                
                // If qty > 0 then add to cart
                if(qty == 0){
                    cart.removeProduct(product: item);
                    return
                }
            }
        }
    }
    
    
    @IBAction func onFChickenDecrement(_ sender: Any) {
        for product in Param.products{
            if(product.id == 6){
                let qty = Int(lblFChickenQty.text!)! - 1;
                lblFChickenQty.text = String(qty);
                var item = product;
                item.qty = qty;
                
                // If qty > 0 then add to cart
                if(qty == 0){
                    cart.removeProduct(product: item);
                    return
                }
            }
        }
    }
    
    @IBAction func onFchickenIncrement(_ sender: Any) {
        for product in Param.products{
            if(product.id == 6){
                let qty = Int(lblFChickenQty.text!)! + 1;
                lblFChickenQty.text = String(qty);
                var item = product;
                item.qty = qty;
                
                // If qty > 0 then add to cart
                if(qty > 0){
                    cart.addToCart(product: item);
                    return;
                }
            }
        }
    }
    
    
    @IBAction func onMCheeseDecrement(_ sender: Any) {
        for product in Param.products{
            if(product.id == 6){
                let qty = Int(lblMCheeseQty.text!)! - 1;
                lblMCheeseQty.text = String(qty);
                var item = product;
                item.qty = qty;
                
                // If qty > 0 then add to cart
                if(qty == 0){
                    cart.removeProduct(product: item);
                    return
                }
            }
        }
    }
    
    @IBAction func onMCheeseIncrement(_ sender: Any) {
        for product in Param.products{
            if(product.id == 7){
                let qty = Int(lblMCheeseQty.text!)! + 1;
                lblMCheeseQty.text = String(qty);
                var item = product;
                item.qty = qty;
                
                // If qty > 0 then add to cart
                if(qty > 0){
                    cart.addToCart(product: item);
                    return;
                }
            }
        }
    }
    
    @IBAction func onNachosDecrement(_ sender: Any) {
        for product in Param.products{
            if(product.id == 9){
                let qty = Int(lblNachosQty.text!)! - 1;
                lblNachosQty.text = String(qty);
                var item = product;
                item.qty = qty;
                
                // If qty > 0 then add to cart
                if(qty == 0){
                    cart.removeProduct(product: item);
                    return
                }
            }
        }
    }
    
    @IBAction func onNachosIncrement(_ sender: Any) {
        for product in Param.products{
            if(product.id == 9){
                let qty = Int(lblBurgerQty.text!)! + 1;
                lblNachosQty.text = String(qty);
                var item = product;
                item.qty = qty;
                
                // If qty > 0 then add to cart
                if(qty > 0){
                    cart.addToCart(product: item);
                    return;
                }
            }
        }
    }
    
    
    func setQty(){
        for item in self.cartItems {
            if(item.id == 2){
                lblBurgerQty.text = String(item.qty);
            }else if(item.id == 6){
                lblFChickenQty.text = String(item.qty);
            }else if(item.id == 7){
                lblMCheeseQty.text = String(item.qty);
            }else if(item.id == 9){
                lblNachosQty.text = String(item.qty);
            }
        }
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
        cell.setup(product: Param.products[indexPath.row], cartItem: self.cartItems);
        return cell;
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let screenSize: CGRect = UIScreen.main.bounds
        let cellHeight = 0.12*screenSize.height;
        return cellHeight;
    }
}


