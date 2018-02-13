//
//  ExamView.swift
//  UIViewSample
//
//  Created by 박소정 on 2018. 2. 14..
//  Copyright © 2018년 sangwook park. All rights reserved.
//

import UIKit

class ExamView: UIView {

    var firstView : UIView!
    var secondView : UIView!
    var thirdView : UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .blue
        create()
    }
    
    func create() {
        firstView = UIView(frame: CGRect(x: 15, y: 15, width: self.bounds.width-30, height: self.bounds.height-30))
        firstView.backgroundColor = .red
        self.addSubview(firstView)
        secondView = UIView(frame: CGRect(x: 15, y: 15, width: firstView.bounds.width-30, height: firstView.bounds.height-30))
        secondView.backgroundColor = .green
        firstView.addSubview(secondView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
