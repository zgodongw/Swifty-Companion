//
//  ProfileViewController.swift
//  Swifty
//
//  Created by Zenande GODONGWANA on 2018/10/16.
//  Copyright © 2018 Zenande GODONGWANA. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var userImage: UIImageView!
    
    @IBOutlet weak var usernameLabel: UILabel!
    
    @IBOutlet weak var view2: UIView!
    
    @IBOutlet weak var userLevel: UILabel!
    
    @IBOutlet weak var userProgress: UIProgressView!
    
    @IBOutlet weak var staff: UILabel!
    @IBOutlet weak var userEmail: UILabel!
    @IBOutlet weak var userWallet: UILabel!
    @IBOutlet weak var userCPoints: UILabel!
    @IBOutlet weak var userMobile: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view1.layer.cornerRadius = 5
        view2.layer.cornerRadius = 5
        userImage.layer.borderWidth = 1
        userImage.layer.masksToBounds = false
        userImage.layer.borderColor = UIColor.black.cgColor
        userImage.layer.cornerRadius = userImage.frame.height/2
        userImage.clipsToBounds = true
        userProgress.transform = userProgress.transform.scaledBy(x: 1, y: 5)
        staff.text = ""
        

        // Do any additional setup after loading the view.
        
        //Don't worry about this
        let level = Data.data!.cursus_users[0].level!.truncatingRemainder(dividingBy: 1)
        
        
        usernameLabel.text = Data.data?.login
        userEmail.text = Data.data?.email
        userWallet.text = String(Data.data!.wallet!)
        userMobile.text = Data.data?.phone
        userCPoints.text = String(Data.data!.correction_point!)
        userLevel.text = String(Data.data!.cursus_users[0].level!)
        userProgress.progress = Float(level)
        if let status = Data.data?.staff {
            if status {
                staff.text = "Staff"
            }
            
        }
        
        if let imageURL = URL(string: "https://cdn.intra.42.fr/users/medium_\(Data.data!.login!).jpg") {
            if let data = try? UIKit.Data(contentsOf: imageURL) {
                userImage.image = UIImage(data: data)
            }
        }
        
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
