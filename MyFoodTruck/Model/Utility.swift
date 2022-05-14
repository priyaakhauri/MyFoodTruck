//
//  Utility.swift
//  MyFoodTruck
//
//  Created by Vishal Jaiswal on 14/5/22.
//

import Foundation

class Utility{
    
    func saveUser(name:String, emailId: String, password:String)  {
        let userDefault = UserDefaults(suiteName: emailId);
        let user = User(name: name, emailId: emailId, password: password);
            do {
                // Create JSON Encoder
                let encoder = JSONEncoder()

                // Encode Note
                let data = try encoder.encode(user);
                userDefault?.set(data, forKey: emailId);
                print("User saved");
            } catch {
                print("Unable to Encode Note (\(error))")
            }
    }
    
    func getUser(emailId: String) -> User{
        let userDefault = UserDefaults(suiteName: emailId);
        var user = User();
        if let data = userDefault?.object(forKey: emailId){
            do {
                // Create JSON Decoder
                let decoder = JSONDecoder();
                // Decode Note
                user = try decoder.decode(User.self, from: data as! Data)
            } catch {
                print("Unable to Decode Note (\(error))")
            }
        }        
        return user;
    }
}
