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
 
        if(user.emailId != ""){
            showAlert(message: "User already exists")
            return
        }else if(txtName.text == ""){
            showAlert(message: "Name field is empty")
            return
        }else if(txtEmailId.text?.isValidEmail == false){
            showAlert(message: "Email is invalid")
            return
        }else if(txtPassword.text!.count < 8){
            showAlert(message: "Password less than 8 char")
            return
        }else if(txtConfirmPassword.text != txtPassword.text){
            showAlert(message: "Confirm password and pasword mismatch")
            return
        }
        
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
    
    @IBAction func onSignInclick(_ sender: Any) {
        let story = UIStoryboard(name: "Main", bundle: nil);
        let mainViewController = story.instantiateViewController(identifier: "mainViewController") as! ViewController;
        self.present(mainViewController, animated: true, completion: nil);
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        txtName.resignFirstResponder();
        txtEmailId.resignFirstResponder();
        txtPassword.resignFirstResponder();
        txtConfirmPassword.resignFirstResponder();
    }
    
    //show Alert
    func showAlert(message:String){
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: UIAlertController.Style.alert)
        
        // add the actions (buttons)
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.default, handler: nil))
        
        // show the alert
        self.present(alert, animated: true, completion: nil)
    }
}

extension String {
    var isValidEmail: Bool {
        NSPredicate(format: "SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}").evaluate(with: self)
    }
}
