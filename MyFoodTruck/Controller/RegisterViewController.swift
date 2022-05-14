//
//  RegisterViewController.swift
//  MyFoodTruck
//
//  Created by Vishal Jaiswal on 14/5/22.
//

import Foundation

import UIKit

class RegisterViewController: UIViewController{
    
    
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtConfirmPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onSignUpClick(_ sender: Any) {
        let utility = Utility();
        let user = utility.getUser(emailId: txtEmail.text!);
        
        // Should not existed before
        // Emaild Textbox should not be empty
        // Name Textbox should not be empty
        // Password Textbox should not be empty
        if(user.emailId == "" && txtEmail.text != "" && txtName.text != "" && txtPassword.text != ""){
            utility.saveUser(name: txtName.text!, emailId: txtEmail.text!, password: txtPassword.text!);
        }
    }
}
