//
//  BasicTableViewCell.swift
//  MainProject
//
//  Created by youngmin joo on 2018. 3. 2..
//  Copyright © 2018년 youngmin joo. All rights reserved.
//

import UIKit

class BasicTableViewCell: UITableViewCell {

    @IBOutlet weak var subTextLb:UILabel!
    
    
    var indexPath:IndexPath?{
        willSet{
            if newValue?.section == 1 && newValue?.row == 0
            {
                subTextLb.text = (Bundle.main.infoDictionary?["CFBundleShortVersionString"] as! String)
            }else
            {
                subTextLb.text = ""
            }
        
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
