//
//  SubJect.swift
//  UI
//
//  Created by 박소정 on 2018. 2. 7..
//  Copyright © 2018년 sangwook park. All rights reserved.
//

import UIKit

class SubJect: UIImageView {

    var mainLB:UILabel!
    var mainBtn:UIButton!

    override init(frame : CGRect) {
        super.init(image: UIImage(named: "Logo.jpeg"))
        self.frame = frame
        create()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func create()
    {
        //레이블 생성
        mainLB = UILabel()
        mainLB.frame = self.bounds
        mainLB.textColor = .black
        mainLB.font = UIFont.systemFont(ofSize: 30)
        mainLB.textAlignment = .center
        self.addSubview(mainLB)
        self.isUserInteractionEnabled = true
        
        //버튼 생성
        mainBtn = UIButton()
        mainBtn.frame = mainLB.bounds
        mainLB.addSubview(mainBtn)
        mainLB.isUserInteractionEnabled = true
        
    }

    func addTarget(_ target: Any?, action: Selector, for controlEvents: UIControlEvents)
    {
        mainBtn.addTarget(target, action: action, for: controlEvents)
    }
}
