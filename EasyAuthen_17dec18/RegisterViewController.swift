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
            showAlert(title: "Have Space", message: "Please Fill All Blank")
        } else {
            print("No Space")
            uploadNewUserToServer(strName: name!, strUser: user!, strPassword: password!)
        }
        
    }   // upload
    
    func uploadNewUserToServer(strName: String, strUser: String, strPassword: String) -> Void {
        print("Name ==> \(strName)")
        print("User ==> \(strUser)")
        print("Password ==> \(strPassword)")
        
        let urlAddUser = "https://www.androidthai.in.th/bua/addDataMaster.php?isAdd=true&Name=\(strName)&User=\(strUser)&Password=\(strPassword)"
        print("urlAddUser ==>\(urlAddUser)")
        
        let url = URL(string: urlAddUser)
        let request = NSMutableURLRequest(url: url!)
        let task = URLSession.shared.dataTask(with: request as URLRequest) {data, response, error in
            
            if error != nil {
                print("Have Error")
            } else {
               
                if let testReadable = data {
                    
                    let canReadData = NSString(data: testReadable, encoding: String.Encoding.utf8.rawValue)
                    print("canReadData ==> \(canReadData!)")
                    
                   let myResult = canReadData!
                    if myResult == "True" {
                        
                        DispatchQueue.main.async {
                            self.performSegue(withIdentifier: "back_home", sender: self)
                        }
                        
                    }   else {
                        print("Cannot Upload To Server")
                    }
                }
            }
        }   // task
        task.resume()
    }
    
    
    func showAlert(title: String, message: String) -> Void {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
        }))
        self.present(alert, animated: true, completion: nil)
        
        
    }
    
    
    
}   // Main Class
