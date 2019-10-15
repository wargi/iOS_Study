//
//  MyCustomView.swift
//  UITest2
//
//  Created by 박소정 on 2018. 2. 2..
//  Copyright © 2018년 sangwook park. All rights reserved.
//

import UIKit

class MyCustomView: UIView {
    //글꼴 확인 레이블 생성
    private var mainLB : UILabel!
    private let imagTemp : UIImage = UIImage(named: "Logo.jpeg")!
    var lableArray : [UILabel] = []
    private var imageArray : [UIImageView] = []
    var btnArray : [UIButton] = []
    private var titleArray : [String] = ["첫번째","두번째","세번째","네번째"]
    
    var mainLBTitle:String {
        get {
            guard let myLBText = mainLB.text else { return "에러" }
            return myLBText
        }
        set {
            mainLB.text = newValue
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        create()
        updateFrame()
    }
    
    func create()
    {
        for i in 0..<4
        {
            lableArray.append(UILabel())
            imageArray.append(UIImageView())
            btnArray.append(UIButton(type: .custom))
            
            imageArray[i].isUserInteractionEnabled = true
            imageArray[i].image = imagTemp
            lableArray[i].isUserInteractionEnabled = true
            lableArray[i].text = titleArray[i]
            lableArray[i].textColor = .black
            lableArray[i].textAlignment = .center
            lableArray[i].font = UIFont.systemFont(ofSize: 30)
            
            btnArray[i].tag = i
//            btnArray[i].addTarget(self, action: #selector(self.btnClickToEvent(_:)), for: .touchUpInside)
            self.addSubview(imageArray[i])
            imageArray[i].addSubview(lableArray[i])
            lableArray[i].addSubview(btnArray[i])
        }
        mainLB = UILabel()
        mainLB.text = "값이 아직 없습니다."
        mainLB.font = UIFont.systemFont(ofSize: 30)
        mainLB.textColor = .black
        mainLB.textAlignment = .center
        mainLB.layer.borderColor = UIColor.black.cgColor
        mainLB.layer.borderWidth = 4
        self.addSubview(mainLB)
    }
    
    func updateFrame()
    {
        let width: CGFloat = 150
        let count: Int = 4
        var offsetX:CGFloat = 25
        var offsetY:CGFloat = 50
        
        for i in 0..<count {
            offsetY = i == (count / 2) ? width + 100 : offsetY
            offsetX = i % 2 == 0 ? 25 : width + 50
            
            imageArray[i].frame = CGRect(x: offsetX, y: offsetY, width: width, height: width)
            lableArray[i].frame = imageArray[i].bounds
            btnArray[i].frame = lableArray[i].bounds
        }
        mainLB.frame = CGRect(x: offsetX - width - 25, y: offsetY + width + 50, width: width * 2 + 25, height: width)
    }
    
    func addTarget(_ taget: Any, action: Selector, event: UIControlEvents) -> Int {
        var count: Int = 0
        for button in btnArray {
            button.addTarget(taget, action: action, for: event)
            count = button.tag
        }
        return count
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
