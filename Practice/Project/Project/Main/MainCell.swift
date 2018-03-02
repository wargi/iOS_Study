//
//  MainCell.swift
//  Project
//
//  Created by 박소정 on 2018. 2. 28..
//  Copyright © 2018년 sangwook park. All rights reserved.
//

import UIKit

class MainCell: UITableViewCell {

    @IBOutlet var imgView: UIImageView!
    @IBOutlet var nameLb: UILabel!
    @IBOutlet var statusLb: UILabel!
    
    var cellData:UserModel?{
        willSet{
           if let data = newValue
           {
                nameLb.text = data.nickname
                imgView.image = UIImage(named: data.profileImgUrl)
                statusLb.text = data.statusDescription
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imgView.layer.cornerRadius = imgView.frame.size.width / 2
        imgView.clipsToBounds = true
        imgView.layer.borderColor = UIColor.black.cgColor
        imgView.layer.borderWidth = 0.3
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
