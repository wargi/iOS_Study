//
//  DrinkItem.swift
//  UIExam
//
//  Created by 박소정 on 2018. 2. 7..
//  Copyright © 2018년 sangwook park. All rights reserved.
//

import UIKit

class DrinkItem: UIView {

    var imgView:UIImageView!
    var priceLB:UILabel!
    var itemBtn:UIButton!
    
    override init(frame : CGRect) {
        super.init(frame : frame)
    }
    
    convenience init(frame : CGRect, imgFile : UIImage, price : Int) {
        self.init(frame: frame)
        imgView = UIImageView(image: imgFile)
        create()
        priceLB.text = String(price) + "원"
        itemBtn.tag = price
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func create()
    {
        let height:CGFloat = self.bounds.size.height / 5
        imgView.frame = CGRect(x: 0, y: 0, width: self.bounds.size.width, height: height * 4)
        self.addSubview(imgView)
        self.isUserInteractionEnabled = true
        
        priceLB = UILabel(frame : CGRect(x: 0, y: height * 4, width: self.bounds.size.width, height: height))
        priceLB.textAlignment = .right
        priceLB.font = UIFont.systemFont(ofSize: 20)
        priceLB.textColor = .black
        self.addSubview(priceLB)
        
        itemBtn = UIButton(frame: self.bounds)
        self.addSubview(itemBtn)
    }
    
    func addTarget(_ target: Any?, action: Selector, for controlEvents: UIControlEvents) {
        itemBtn.addTarget(target, action: action, for: controlEvents)
    }

}
