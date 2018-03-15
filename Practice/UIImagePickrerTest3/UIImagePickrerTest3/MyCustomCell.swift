//
//  MyCustomCell.swift
//  UIImagePickrerTest3
//
//  Created by 박소정 on 2018. 3. 15..
//  Copyright © 2018년 sangwook park. All rights reserved.
//

import UIKit

class MyCustomCell: UICollectionViewCell {
    
    @IBOutlet private weak var imgView: UIImageView!
    
    var imgInput: UIImage? {
        didSet {
            imgView!.image = imgInput
        }
    }

    override func awakeFromNib() {
        imgView.frame = self.bounds
    }
}
