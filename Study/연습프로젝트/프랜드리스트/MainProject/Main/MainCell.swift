//
//  MainCell.swift
//  MainProject
//
//  Created by youngmin joo on 2018. 2. 28..
//  Copyright © 2018년 youngmin joo. All rights reserved.
//

import UIKit

class MainCell: UITableViewCell {

    @IBOutlet var imgView:UIImageView!
    @IBOutlet var nameLb:UILabel!
    @IBOutlet var statusLb:UILabel!
    
    var cellData:UserModel?{
        willSet{
            if let data = newValue
            {
                nameLb.text = data.nickName
                imgView.image = UIImage(named:data.profileImgUrl)
                statusLb.text = data.statusDescription
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func layoutIfNeeded() {
        super.layoutIfNeeded()
        imgView.layer.cornerRadius = imgView.frame.size.width/2
        imgView.clipsToBounds = true
        imgView.layer.borderColor = UIColor.black.cgColor
        imgView.layer.borderWidth = 1
    }
    
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}







