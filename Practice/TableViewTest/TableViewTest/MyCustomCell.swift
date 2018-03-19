//
//  MyCustomCell.swift
//  TableViewTest
//
//  Created by 박소정 on 2018. 3. 16..
//  Copyright © 2018년 sangwook park. All rights reserved.
//

import UIKit

class MyCustomCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

extension MyCustomCell {
    static var identifier: String {
        print(self.identifier)
        return String(describing: self.self) }
}
