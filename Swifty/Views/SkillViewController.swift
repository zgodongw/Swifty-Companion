//
//  SkillViewController.swift
//  Swifty
//
//  Created by Zenande GODONGWANA on 2018/10/16.
//  Copyright © 2018 Zenande GODONGWANA. All rights reserved.
//

import UIKit

class SkillViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.tableFooterView = UIView()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (Data.skills?.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "skillCell", for: indexPath) as? SkillTableViewCell
        let level = Data.skills![indexPath.row].level!.truncatingRemainder(dividingBy: 1)
        
        cell?.skillName.text = Data.skills![indexPath.row].name
        cell?.skillLevel.text! = String(Data.skills![indexPath.row].level!)
        cell?.skillProgress.progress = Float(level)
        
        return cell!
    }

}
