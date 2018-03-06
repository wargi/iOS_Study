//
//  MyCollectionViewCell.swift
//  MyCalendar
//
//  Created by 박소정 on 2018. 3. 5..
//  Copyright © 2018년 sangwook park. All rights reserved.
//

import UIKit

class MyCollectionViewCell: UICollectionViewCell {
    @IBOutlet var cellTitle: UILabel!
    var date: Date!
    
    var dateInput:Date? {
        willSet {
            date = newValue
        }
    }
}
