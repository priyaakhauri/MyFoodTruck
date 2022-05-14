//
//  ViewController.swift
//  MyFoodTruck
//
//  Created by Ankur Akhauri on 10/05/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtEmailId: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
   

    @IBAction func onSignInClick(_ sender: Any) {
        if(txtEmailId.text != "" && txtPassword.text != ""){
            let user = Utility().getUser(emailId: txtEmailId.text!);
            if(user.emailId == txtEmailId.text && user.password == txtPassword.text){
                // Navigate to menu
                print("Authenticated");
            }else{
                print("Failed");
            }
        }
    }
    
}

