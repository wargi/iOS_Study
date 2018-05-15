//
//  HitAndStandBtn.swift
//  BlackJack
//
//  Created by 박상욱 on 2018. 2. 17..
//  Copyright © 2018년 sangwook park. All rights reserved.
//

import UIKit

class DisplayButton: UIView {

    //Display Button 객체 생성
    var stand : UIButton!
    var hit : UIButton!
    var reStart : UIButton!
    
    //버튼 설정 및 초기화 함수
    func create() {
        
        //hit Button 초기화 및 설정
        hit = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
        hit.setTitle("Hit", for: .normal)
        hit.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        hit.titleLabel?.textColor = UIColor.lightGray
        hit.backgroundColor = .black
        hit.layer.borderWidth = 5
        hit.layer.borderColor = UIColor.white.cgColor
        self.addSubview(hit)
        
        //stand Button 초기화 및 설정
        stand = UIButton(frame: CGRect(x: 110, y: 0, width: 100, height: 50))
        stand.setTitle("Stand", for: .normal)
        stand.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        stand.titleLabel?.textColor = UIColor.darkGray
        stand.backgroundColor = .black
        stand.layer.borderWidth = 5
        stand.layer.borderColor = UIColor.white.cgColor
        self.addSubview(stand)
        
        //reStart Button 초기화 및 설정
        reStart = UIButton(frame: CGRect(x: 220, y: 0, width: 100, height: 50))
        reStart.setTitle("Restart", for: .normal)
        reStart.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        reStart.titleLabel?.textColor = UIColor.darkGray
        reStart.backgroundColor = .black
        reStart.layer.borderWidth = 5
        reStart.layer.borderColor = UIColor.white.cgColor
        self.addSubview(reStart)
    }
    
    //버튼들의 이벤트 처리
    func addTarget(_ target: Any?, action: Selector, for controlEvents: UIControlEvents) {
        hit.addTarget(target, action: action, for: .touchUpInside)
        stand.addTarget(target, action: action, for: .touchUpInside)
        reStart.addTarget(target, action: action, for: .touchUpInside)
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        create()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
