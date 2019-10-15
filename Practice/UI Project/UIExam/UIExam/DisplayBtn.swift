//
//  DisplayBtn.swift
//  UIExam
//
//  Created by 박소정 on 2018. 2. 7..
//  Copyright © 2018년 sangwook park. All rights reserved.
//

import UIKit

class DisplayBtn: UIView {

    var thousand : UIButton!
    var fiveHundred : UIButton!
    var returnBtn : UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        create()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func create()
    {
        let width : CGFloat = (self.bounds.size.width / 3) - 15
        thousand = UIButton(frame : CGRect(x: 15, y: 0, width: width, height: self.bounds.size.height))
        thousand.setTitle("1000원", for: .normal)
        thousand.setTitleColor(.black, for: .normal)
        thousand.tag = 1000
        thousand.layer.borderWidth = 1
        self.addSubview(thousand)
        
        fiveHundred = UIButton(frame : CGRect(x: width + 22.5, y: 0, width: width, height: self.bounds.size.height))
        fiveHundred.setTitle("500원", for: .normal)
        fiveHundred.setTitleColor(.black, for: .normal)
        fiveHundred.tag = 500
        fiveHundred.layer.borderWidth = 1
        self.addSubview(fiveHundred)
        
        returnBtn = UIButton(frame : CGRect(x: (width * 2) + 30, y: 0, width: width, height: self.bounds.size.height))
        returnBtn.setTitle("반환", for: .normal)
        returnBtn.setTitleColor(.black, for: .normal)
        returnBtn.tag = 0
        returnBtn.layer.borderWidth = 1
        self.addSubview(returnBtn)
    }
    
    func addTarget(_ target: Any?, action: Selector, for controlEvents: UIControlEvents) {
        thousand.addTarget(target, action: action, for: controlEvents)
    }
    func huAddTarget(_ target: Any?, action: Selector, for controlEvents: UIControlEvents) {
        fiveHundred.addTarget(target, action: action, for: controlEvents)
    }
    func thAddTarget(_ target: Any?, action: Selector, for controlEvents: UIControlEvents) {
        returnBtn.addTarget(target, action: action, for: controlEvents)
    }
}
