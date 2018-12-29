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
    let mySegue: String = "success_login"
    
    
    let demoData = ["user1":"1231", "user2":"1232", "user3":"1233", "user4":"1234", "user5":"1235"]
    
    
    
    
    
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
            checkUserAnPassword(userString: user, passwordString: password)
            
            
            
        }   // if
        
        
    }   // loginButton Function
    
    func checkUserAnPassword(userString: String, passwordString: String) -> Void {
        
        //            Test Variable Nil ?
        if let testPassword = demoData[userString] {
            
            let truePassword = testPassword
            print("truePassword ==> " + truePassword)
            
            if (passwordString == truePassword) {
//                Authen True
                
                performSegue(withIdentifier: mySegue, sender: self)
                
            } else {
//                Authen False
                myAlert(title: "Password False", message: "Please Try Again Password False")
            }
            
        } else {
            myAlert(title: "User False", message: "No \(userString) in my Database")
        }
        
        
        
        
//        let truePassword = demoData[userString]
//        print("truePassword ==> " + truePassword!)
        
        
    }
    
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

