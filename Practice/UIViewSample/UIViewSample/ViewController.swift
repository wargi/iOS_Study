//
//  ViewController.swift
//  UIViewSample
//
//  Created by 박상욱 on 2018. 2. 14..
//  Copyright © 2018년 sangwook park. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //3개의 뷰 생성
    var firstView : UIView!
    var secondView : UIView!
    var thirdView : UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        create()
    }
    
    func create() {
        //첫번째 뷰 프레임 지정
        firstView = UIView(frame: CGRect(x: 15, y: 15, width: view.bounds.width-30, height: view.bounds.height-30))
        firstView.backgroundColor = .blue
        view.addSubview(firstView) //루트 뷰위에 addSubView 해준다
        
        //두번쨰 뷰 프레임 지정
        secondView = UIView(frame: CGRect(x: 15, y: 15, width: firstView.bounds.width-30, height: firstView.bounds.height-30))
        secondView.backgroundColor = .red
        firstView.addSubview(secondView) //첫번째 뷰위에 addSubView 해준다
        
        //세번째 뷰 프레임 지정
        thirdView = UIView(frame: CGRect(x: 15, y: 15, width: secondView.bounds.width-30, height: secondView.bounds.height-30))
        thirdView.backgroundColor = .green
        secondView.addSubview(thirdView) //두번쨰 뷰위에 addSubView 해준다
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

