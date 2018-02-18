//
//  back.swift
//  BlackJack
//
//  Created by 박상욱 on 2018. 2. 16..
//  Copyright © 2018년 sangwook park. All rights reserved.
//

import UIKit

class BackView: UIImageView {
    
    //블랙잭 배경화면 설정
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.image = UIImage(named: "backImg.jpg")
        self.isUserInteractionEnabled = false
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
