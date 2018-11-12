//
//  SkillTableViewCell.swift
//  Swifty
//
//  Created by Zenande GODONGWANA on 2018/10/17.
//  Copyright © 2018 Zenande GODONGWANA. All rights reserved.
//

import UIKit

class SkillTableViewCell: UITableViewCell {

    @IBOutlet weak var skillName: UILabel!
    @IBOutlet weak var skillLevel: UILabel!
    @IBOutlet weak var skillProgress: UIProgressView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
