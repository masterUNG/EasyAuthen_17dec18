//
//  ViewController.swift
//  EasyAuthen_17dec18
//
//  Created by MasterUNG on 17/12/2561 BE.
//  Copyright © 2561 MasterUNG. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
//    Explicit
    var user: String = ""
    var password: String = ""
    
    
    
    
    @IBOutlet weak var userTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    
    
    @IBAction func loginButton(_ sender: Any) {
        
//        Check Click
        print("Click loginButton")
        
//        Get Value From TextField
        user = userTextField.text!
        password = passwordTextField.text!
        print("user ==> \(user)")
        print("password ==> \(password)")
        
//        Check Space
        if (user.count == 0) || (password == "") {
//            Have Space
            print("Have Space")
            myAlert(title: "Have Space", message: "Please Fill Every Blank")
        }   else    {
//            No Space
            print("No Space")
        }   // if
        
        
    }   // loginButton Function
    
    func myAlert(title: String, message: String) -> Void {
        
        let objAlert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        objAlert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { (UIAlertAction) in
            objAlert.dismiss(animated: true, completion: nil)
        }))
        self.present(objAlert, animated: true, completion: nil)
        
        
        
    }   // myAlert Function
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }   // Main Function


}   // Main Class

