//
//  StatusDisplay.swift
//  BlackJack
//
//  Created by 박상욱 on 2018. 2. 17..
//  Copyright © 2018년 sangwook park. All rights reserved.
//

import UIKit

class DisplayStatus: UIView {

    //레이블 생성
    var nameLB : UILabel!
    var centerLB : UILabel!
    
    //nameLB 설정 및 초기화 함수
    func stausCreate(name : String) {
        nameLB = UILabel(frame: CGRect(x: 15, y: 0, width: 50, height: 50))
        nameLB.text = name
        nameLB.textAlignment = .center
        nameLB.textColor = UIColor.red
        nameLB.font = UIFont.boldSystemFont(ofSize: 20)
        self.addSubview(nameLB)
    }
    
    //centerLB 설정 및 초기화 함수
    func centerCreate() {
        centerLB = UILabel(frame: CGRect(x: 0, y: 0, width: 300, height: 300))
        centerLB.text = "BlackJack"
        centerLB.textAlignment = .center
        centerLB.textColor = UIColor.blue
        centerLB.numberOfLines = 0
        centerLB.font = UIFont.boldSystemFont(ofSize: 50)
        self.addSubview(centerLB)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    convenience init(frame: CGRect, name : String) {
        self.init(frame: frame)
        stausCreate(name : name)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
