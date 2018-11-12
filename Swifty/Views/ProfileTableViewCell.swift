//
//  ProfileTableViewCell.swift
//  Swifty
//
//  Created by Zenande GODONGWANA on 2018/10/17.
//  Copyright © 2018 Zenande GODONGWANA. All rights reserved.
//

import UIKit

class ProfileTableViewCell: UITableViewCell {
    
    @IBOutlet weak var projectName: UILabel!
    
    @IBOutlet weak var projectMark: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
