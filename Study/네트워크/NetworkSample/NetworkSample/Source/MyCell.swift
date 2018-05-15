//
//  MyCell.swift
//  NetworkSample
//
//  Created by 박소정 on 2018. 3. 28..
//  Copyright © 2018년 sangwook park. All rights reserved.
//

import UIKit

class MyCell: UITableViewCell {

    @IBOutlet var title: UILabel!
    @IBOutlet var content: UILabel!
    @IBOutlet var date: UILabel!
//    @IBOutlet private weak var <#code#> : <#Type#>!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
