//
//  HomeViewController.swift
//  MyFoodTruck
//
//  Created by Chetan Chouhan on 11/5/2022.
//


import UIKit

class HomeViewController: UIViewController {

    
    @IBOutlet weak var leading: NSLayoutConstraint!
    @IBOutlet weak var trailing: NSLayoutConstraint!
    
    var menuOut = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
    }

    @IBAction func menuTapped(_ sender: Any) {
            
        if menuOut == false {
            leading.constant = 250
            trailing.constant = -250
            menuOut = true
        } else {
            leading.constant = 0
            trailing.constant = 0
            menuOut = false
            
        }
    
    }
}

