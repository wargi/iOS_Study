//
//  ResultLB.swift
//  UIExam
//
//  Created by 박소정 on 2018. 2. 7..
//  Copyright © 2018년 sangwook park. All rights reserved.
//

import UIKit

class ResultLB: UIView {

    var stateLB : UILabel!
    var changedLB : UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .black
        create()
    }
    
    func create()
    {

        stateLB = UILabel(frame : CGRect(x: 0, y: 0, width: self.bounds.size.width, height: self.bounds.size.height / 2))
        stateLB.text = "결과 Text"
        stateLB.textAlignment = .right
        stateLB.font = UIFont.systemFont(ofSize: 30)
        stateLB.textColor = .white
        self.addSubview(stateLB)
        
        changedLB = UILabel(frame : CGRect(x: 0, y: stateLB.bounds.height, width: self.bounds.size.width, height: self.bounds.size.height / 2))
        changedLB.text = "잔액 : 0원"
        changedLB.textAlignment = .right
        changedLB.font = UIFont.systemFont(ofSize: 30)
        changedLB.textColor = .white
        self.addSubview(changedLB)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
