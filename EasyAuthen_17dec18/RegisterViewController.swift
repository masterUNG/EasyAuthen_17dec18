//
//  RegisterViewController.swift
//  EasyAuthen_17dec18
//
//  Created by MasterUNG on 18/12/2561 BE.
//  Copyright © 2561 MasterUNG. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {
    
    var name: String?
    var user: String?
    var password: String?
    
    
    
    
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var userTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }   // Main Function
    
    
    @IBAction func uploadButton(_ sender: Any) {
        
        print("Click Upload")
        
        if let testName = nameTextField.text {
            name = testName
        }
        print("name ==>\(String(describing: name!))")
        
        if let testUser = userTextField.text {
            user = testUser
        }
        print("user ==> \(String(describing: user))")
        
        if let testPassword = passwordTextField.text {
            password = testPassword
        }
        print("password ==>\(String(describing: password))")
        
        
        if (name!.count == 0) || (user!.count == 0) || (password!.count == 0) {
            print("Something Have Space")
        } else {
            print("No Space")
            
        }
        
        
        
        
    }   // upload
    
    
    
    
    
}   // Main Class
