//
//  ProjectViewController.swift
//  Swifty
//
//  Created by Zenande GODONGWANA on 2018/10/16.
//  Copyright © 2018 Zenande GODONGWANA. All rights reserved.
//

import UIKit

class ProjectViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //tableView.separatorColor = UIColor.white
        self.tableView.tableFooterView = UIView()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (Data.projects?.count)!;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "projectCell", for: indexPath) as? ProfileTableViewCell
        
        cell?.projectName.text = Data.projects![indexPath.row].project?.name
        if let mark = Data.projects![indexPath.row].final_mark {
            cell?.projectMark.text = String(mark)
            if mark >= 75 {
                 cell?.projectMark.textColor = UIColor.green
            } else {
                cell?.projectMark.textColor = UIColor.red
            }
        } else {
            cell?.projectMark.text = "null"
        }
        
        
        return cell!
    }
    

}
