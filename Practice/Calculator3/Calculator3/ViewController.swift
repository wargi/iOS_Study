//
//  ViewController.swift
//  Calculator3
//
//  Created by 박소정 on 2018. 1. 30..
//  Copyright © 2018년 sangwook park. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var displayView:UILabel!
    var keyPadView:UIView!
    var etcView:UIView!
    var opeView:UIView!
    var numberPadView:UIView!
    
    var etcBtnList:[UIButton]!
    var operBtnList:[UIButton]!
    var numberBtnList:[UIButton]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        createUI()
        updateUIFrame()
    }

    //UI인스턴스 만드는 메소드
    private func createUI()
    {
        displayView = UILabel()
        self.view.addSubview(displayView)
        displayView.text = "0"
        displayView.textAlignment = NSTextAlignment.right
        displayView.font = UIFont.systemFont(ofSize: 100)
        displayView.textColor = UIColor.white
        keyPadView = UIView()
        self.view.addSubview(keyPadView)
        
        
        etcView = UIView()
        keyPadView.addSubview(etcView)
        opeView = UIView()
        keyPadView.addSubview(opeView)
        numberPadView = UIView()
        keyPadView.addSubview(numberPadView)
        
        displayView.backgroundColor = .darkGray
        keyPadView.backgroundColor = .black
        etcView.backgroundColor = .red
        opeView.backgroundColor = .blue
        numberPadView.backgroundColor = .yellow
        
        etcBtnList = makeBtn(count: 3)
        operBtnList = makeBtn(count: 5)
        numberBtnList = makeBtn(count: 10)
        
        addSub(btnTemp: etcBtnList, superView: etcView)
        addSub(btnTemp: operBtnList, superView: opeView)
        addSub(btnTemp: numberBtnList, superView: numberPadView)
    }
    
    //버튼을 생성
    func makeBtn(count : Int) -> [UIButton] {
        var btnTemp:[UIButton] = []
        
        for _ in 0..<count {
            let btn : UIButton = UIButton()
            btn.layer.borderWidth = 1
            btn.layer.borderColor = UIColor.black.cgColor
            btnTemp.append(btn)
        }
        return btnTemp
    }
    
    //버튼들을 addSub
    func addSub(btnTemp : [UIButton], superView : UIView)
    {
        for number in 0..<btnTemp.count {
            superView.addSubview(btnTemp[number])
        }
    }
    
    //버튼의 프레임을 설정해주는 함수
    func btnFrame(btnTemp : [UIButton], btnWidth : CGFloat, n: Int)
    {
        for number in 0..<btnTemp.count {
            let col: Int = number % n
            let row: Int = number / n
            
            btnTemp[number].frame = CGRect(x: CGFloat(col)*btnWidth, y: CGFloat(row)*btnWidth, width: btnWidth, height: btnWidth)
        }
    }
    
    //UI인스턴스 프레임 설정 메소드
    private func updateUIFrame()
    {
        //버튼은 화면의 가로에 4개씩 배치
        let btnWidth : CGFloat = view.frame.size.width / 4
        //아래에서부터 배치
        var offSetY:CGFloat = self.view.frame.size.height - btnWidth * 5
        let col:Int = 3
        
        //KeyPad영역 프레임
        let displayViewHeight:CGFloat = 150
        keyPadView.frame = CGRect(x: 0, y: offSetY, width: view.frame.size.width, height: btnWidth * 5)
        //displayView영역 프레임
        offSetY -= displayViewHeight
        displayView.frame = CGRect(x: 0, y: 100, width: view.frame.size.width, height: displayViewHeight)
        
        //KeyPad영역에 들어가는 뷰리스트들의 프레임
        etcView.frame = CGRect(x: 0, y: 0, width: btnWidth * 3, height: btnWidth)
        opeView.frame = CGRect(x: btnWidth * 3, y: 0, width: btnWidth, height: btnWidth * 5)
        numberPadView.frame = CGRect(x: 0, y: btnWidth, width: btnWidth * 3, height: btnWidth * 4)
        
        //버튼들의 프레임 설정
        btnFrame(btnTemp: etcBtnList, btnWidth: btnWidth, n: col)
        btnFrame(btnTemp: numberBtnList, btnWidth: btnWidth, n: col)
        btnFrame(btnTemp: operBtnList, btnWidth: btnWidth, n: 1)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

