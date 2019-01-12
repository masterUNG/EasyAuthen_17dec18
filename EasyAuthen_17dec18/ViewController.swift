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
    let mySegue: String = "GoToShowProduct"
    var receiveJSON: String?
    
    
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
            loadJSON(userString: user, passwordString: password)
            
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
        
    }   // Main Function
    

    
    func loadJSON(userString: String, passwordString: String) -> Void {
        
        let urlPHP: String = "https://www.androidthai.in.th/bua/getUserWhereUserMaster.php?isAdd=true&User=\(userString)"
        
        let urlAPI = URL(string: urlPHP)
        let request = NSMutableURLRequest(url: urlAPI!)
        let task = URLSession.shared.dataTask(with: request as URLRequest) { data, response, error in
            
            if (error != nil) {
                print("Have Error")
            } else {
                
                if let testData = data {
                    
                    let canReadable = NSString(data: testData, encoding: String.Encoding.utf8.rawValue)
                    print("canReadabel ==> \(canReadable!)")
                    
                    let resultJSON = canReadable!
                    
                    if resultJSON == "null" {
//                        User False
                        
                        DispatchQueue.main.async {
                            self.myAlert(title: "User False", message: "No This User in my Database")
                        }
                        
                    } else {
                        
                        var jsonString: String = canReadable! as String
                        
                        
                        let squareBrackers1 = "["
                        let squareBrackers2 = "]"
                        
                        let noPrefixJSON = jsonString.components(separatedBy: squareBrackers1)
                        let noSubfixJSON = noPrefixJSON[1].components(separatedBy: squareBrackers2)
                        
                        jsonString = noSubfixJSON[0]
                        print("jsonString ==> \(jsonString)")
                        
                        //                    self.convertStringToDictionary(jsonString: jsonString)
                        
                    }
                    
                } // if
            } // if
            
        }   // task
        task.resume()

    }   //loadJSoN
    
    func convertStringToDictionary(jsonString: String) -> Void {
        print("receiveJSoN ==> \(jsonString)")
        let testJSONung = "{\"user1\":\"1231\", \"user2\":\"555\"}"
//        let testJSONung = jsonString
        var myDictionary: NSDictionary?
        if let myJSON = testJSONung.data(using: String.Encoding.utf8) {
            do {
                myDictionary = try JSONSerialization.jsonObject(with: myJSON, options: []) as? [String: AnyObject] as NSDictionary?
//                print("myDictionary ==> \(String(describing: myDictionary))")
                if let testDict = myDictionary {
                    print("testDict ==> \(testDict)")
                    print("testDict[user2]\(String(describing: testDict["user2"]))")
                }
            } catch let error as NSError {
                print("convert Error ==> \(error)")
            }
        }   // if        
    }   // convert

}   // Main Class

