//
//  ViewController.swift
//  MyFoodTruck
//
//  Created by Ankur Akhauri on 10/05/22.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var txtEmailId: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        txtPassword.delegate = self;
        txtEmailId.delegate = self;
    }
   
    @IBAction func onSignInClick(_ sender: Any) {
                if(txtEmailId.text != "" && txtPassword.text != ""){
                    let user = Utility().getUser(emailId: txtEmailId.text!);
                    if(user.emailId == txtEmailId.text && user.password == txtPassword.text){
                        // Navigate to menu
                        print("Authenticated");
                        let story = UIStoryboard(name: "Main", bundle: nil);
                        let homeViewController = story.instantiateViewController(identifier: "homeViewController") as! HomeViewController;
                        self.present(homeViewController, animated: true, completion: nil);
                    }else{
                        print("Failed");
                    }
                }
    }
    
    @IBAction func onCreateAccount(_ sender: Any) {
        let story = UIStoryboard(name: "Main", bundle: nil);
        let registerViewController = story.instantiateViewController(identifier: "registerViewController") as! RegisterViewController;
        self.present(registerViewController, animated: true, completion: nil);
      
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        txtPassword.resignFirstResponder();
        txtEmailId.resignFirstResponder();
    }
}

