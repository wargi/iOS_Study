//
//  SwitchTableViewCell.swift
//  MainProject
//
//  Created by youngmin joo on 2018. 3. 2..
//  Copyright © 2018년 youngmin joo. All rights reserved.
//

import UIKit

class SwitchTableViewCell: UITableViewCell {

    @IBOutlet weak var swith:UISwitch!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
