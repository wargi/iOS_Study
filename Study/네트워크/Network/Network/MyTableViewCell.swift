//
//  MyTableViewCell.swift
//  Network
//
//  Created by 박소정 on 2018. 3. 27..
//  Copyright © 2018년 sangwook park. All rights reserved.
//

import UIKit

class MyTableViewCell: UITableViewCell {

    @IBOutlet var imgView : UIImageView?
    @IBOutlet var title : String!
    @IBOutlet var content : String!
    @IBOutlet var date : String!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
