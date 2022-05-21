//
//  RegisterViewController.swift
//  MyFoodTruck
//
//  Created by Vishal Jaiswal on 14/5/22.
//

import Foundation

import UIKit

class RegisterViewController: UIViewController, UITextFieldDelegate{
    
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtEmailId: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtConfirmPassword: UITextField!
     
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        txtName.delegate = self;
        txtEmailId.delegate = self;
        txtPassword.delegate = self;
        txtConfirmPassword.delegate = self;
    }
    
    @IBAction func onSignUpClick(_ sender: Any) {
        let utility = Utility();
         let user = utility.getUser(emailId: txtEmailId.text!);

         // Should not existed before
         // Emaild Textbox should not be empty
         // Name Textbox should not be empty
         // Password Textbox should not be empty
         if(user.emailId == "" && txtEmailId.text != "" && txtName.text != "" && txtPassword.text != ""){
             utility.saveUser(name: txtName.text!, emailId: txtEmailId.text!, password: txtPassword.text!);
            let story = UIStoryboard(name: "Main", bundle: nil);
            let mainViewController = story.instantiateViewController(identifier: "mainViewController") as! ViewController;
            self.present(mainViewController, animated: true, completion: nil);
        }else{
            print("Failed");
        }
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        txtName.resignFirstResponder();
        txtEmailId.resignFirstResponder();
        txtPassword.resignFirstResponder();
        txtConfirmPassword.resignFirstResponder();
    }
}
