//
//  LoginViewController.swift
//  Swifty
//
//  Created by Zenande GODONGWANA on 2018/10/16.
//  Copyright © 2018 Zenande GODONGWANA. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var loginField: UITextField!
    
    @IBOutlet weak var button: UIButton!
    
    @IBOutlet weak var errorLabel: UILabel!
    
    @IBOutlet weak var box: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        button.layer.cornerRadius = 5;
        box.layer.cornerRadius = 10;
        errorLabel.textColor = UIColor.white
        errorLabel.text! = "Enter a username"
        
        if (Client.Token == nil) {
            Client.getToken()
        }
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loginDetail(login: String) -> () {
        if login != "" {
          performSegue(withIdentifier: "loginSegue", sender: self)
        }
        else{
            errorLabel.text! = "Error, Invalid Login!"
        }
    }
    
    func errorHandler() {
        errorLabel.textColor = UIColor.red
        errorLabel.text! = "Error, Invalid Login!"
    }

    @IBAction func seachButton(_ sender: UIButton) {
        errorLabel.textColor = UIColor.white
        errorLabel.text! = "Searching..."
        if loginField.text! != "" {
            if let _  = Client.Token {
                
                let service = Services(accessToken: Client.Token!)
                service.getUserData(userID: loginField.text!, with: loginDetail, and: errorHandler)
  
            }
            else {
                errorLabel.textColor = UIColor.red
                errorLabel.text! = "Token Not Available!"
            }
            
        }
        else {
            errorLabel.textColor = UIColor.red
            errorLabel.text! = "Error, Invalid Login!"
        }
        
    }
    
}
