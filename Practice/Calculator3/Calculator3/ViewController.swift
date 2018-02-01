//
//  ViewController.swift
//  Calculator3
//
//  Created by 박상욱 on 2018. 1. 30..
//  Copyright © 2018년 sangwook park. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var displayView:UILabel!
    
    //UIUIView 변수 선언
    var keyPadView:UIView!
    var etcView:UIView!
    var opeView:UIView!
    var numberPadView:UIView!
    
    //UIButton 변수 선언
    var etcBtnList:[UIButton]!
    var operBtnList:[UIButton]!
    var numberBtnList:[UIButton]!
    
    //tittleArray 선언 및 리터럴
    var etcTitleArray:[String] = ["C","+/-","%"]
    var numberTitleArray:[String] = ["7","8","9","4","5","6","1","2","3","0"]
    var operTitleArray:[String] = ["/","*","-","+","="]
    
    //계산기관련 값 임시저장소 및 연산자 저장소와 화면관련 변수 선언
    var leftNumberTemp:Int?
    var operTemp:String?
    var displayCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        createUI() //UI생성
        updateUIFrame() //UIFrame 설정
        
    }
    
    //UI인스턴스 만드는 메소드
    private func createUI()
    {
        //displayView UI생성 및 설정, keyPadView UI생성
        displayView = UILabel()
        self.view.addSubview(displayView)
        displayView.text = "0"
        displayView.textAlignment = NSTextAlignment.right
        displayView.font = UIFont.systemFont(ofSize: 100)
        displayView.textColor = UIColor.white
        keyPadView = UIView()
        self.view.addSubview(keyPadView)
        
        //etcView, opeView, numberPadView UI생성 및 addSub
        etcView = UIView()
        keyPadView.addSubview(etcView)
        opeView = UIView()
        keyPadView.addSubview(opeView)
        numberPadView = UIView()
        keyPadView.addSubview(numberPadView)
        
        //뷰들의 컬러 설정
        displayView.backgroundColor = .black
        etcView.backgroundColor = UIColor.gray
        opeView.backgroundColor = .orange
        numberPadView.backgroundColor = UIColor.lightGray
        
        //버튼 UI생성
        etcBtnList = makeBtn(count: 3)
        operBtnList = makeBtn(count: 5)
        numberBtnList = makeBtn(count: 12)
        
        //버튼 addsub
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
        displayView.frame = CGRect(x: 0, y: 20, width: view.frame.size.width, height: view.bounds.size.height - keyPadView.bounds.size.height - 20)
        
        //KeyPad영역에 들어가는 뷰리스트들의 프레임
        etcView.frame = CGRect(x: 0, y: 0, width: btnWidth * 3, height: btnWidth)
        opeView.frame = CGRect(x: btnWidth * 3, y: 0, width: btnWidth, height: btnWidth * 5)
        numberPadView.frame = CGRect(x: 0, y: btnWidth, width: btnWidth * 3, height: btnWidth * 4)
        
        //버튼들의 프레임 설정
        btnFrame(btnTemp: etcBtnList, btnWidth: btnWidth, n: col)
        btnFrame(btnTemp: numberBtnList, btnWidth: btnWidth, n: col)
        btnFrame(btnTemp: operBtnList, btnWidth: btnWidth, n: 1)
        
        //버튼들의 타이틀을 지정
        btnSetTitle(titleList: etcTitleArray, btnList: etcBtnList, btnSize: 50, btnTextColor: .black)
        btnSetTitle(titleList: numberTitleArray, btnList: numberBtnList, btnSize: 50, btnTextColor: .black)
        btnSetTitle(titleList: operTitleArray, btnList: operBtnList, btnSize: 50, btnTextColor: .black)
    }
    
    
    /// 버튼을 가지고 와서 버튼의 타이틀을 지정하고 addTarget 해준다.
    ///
    /// - Parameters:
    ///   - titleList: 각 버튼의 타이틀을 저장하고 있는 배열
    ///   - btnList: 타이틀을 지정 해줄 버튼들
    ///   - btnSize: 설정할 버튼의 사이즈
    ///   - btnTextColor: 설정할 버튼의 컬러
    func btnSetTitle(titleList: [String], btnList: [UIButton], btnSize: CGFloat, btnTextColor: UIColor)
    {
        for number in 0..<titleList.count {
            btnList[number].setTitle(titleList[number], for: .normal)
            btnList[number].titleLabel?.font = UIFont.systemFont(ofSize: 50)
            btnList[number].setTitleColor(.black, for: .normal)
            
            if titleList == etcTitleArray
            {
                btnList[number].addTarget(self, action: #selector(self.etcBtnEvents(_:)), for: .touchUpInside)
            }
            else if titleList == numberTitleArray
            {
                btnList[number].addTarget(self, action: #selector(self.numBtnEvents(_:)), for: .touchUpInside)
            }
            else if titleList == operTitleArray
            {
                btnList[number].addTarget(self, action: #selector(self.operBtnEvents(_:)), for: .touchUpInside)
            }
        }
    }
    
    //numberBtn에 touchUpInside의 이벤트가 발생 할 때 생기는 이벤트
    @objc func numBtnEvents(_ sender: UIButton)
    {
        guard let buttonTitle = sender.titleLabel?.text else { return }
        guard let displayTitle = self.displayView.text else { return }
        if displayCount == 0
        {
            self.displayView.text = buttonTitle
            displayCount = 1
        } else
        {
            self.displayView.text = displayTitle + buttonTitle
        }
    }
    
    //etcBtn에 touchUpInside의 이벤트가 발생 할 때 생기는 이벤트
    @objc func etcBtnEvents(_ sender: UIButton)
    {
        guard let etcTemp = sender.titleLabel?.text else { return }
        switch etcTemp {
        case "C":
            clear()
        default:
            return
        }
        
    }
    
    //operBtn에 touchUpInside의 이벤트가 발생 할 때 생기는 이벤트
    @objc func operBtnEvents(_ sender: UIButton)
    {
        //operText와 numberTemp의 값이 옵셔널일시에 실행 하지 않는다.
        guard let operText = sender.titleLabel?.text else { return }
        guard let numberTemp = self.displayView.text else { return }
        
        //operText의 값이 '='과 같지 않으면서 leftNumberTemp가 nil일 때 실행
        if operText != "=" && leftNumberTemp == nil {
            operTemp = operText
            leftNumberTemp = Int(numberTemp)
            let numLeft = leftNumberTemp!
            self.displayView.text = String(numLeft)
            displayCount = 0
        }
        //operText의 값이 '='과 같으면서 leftNumberTemp가 nil이 아닐 때 실행
        else if operText == "=", var numLeft = leftNumberTemp
        {
            if Int(numberTemp) == numLeft
            {
                displayCount = 0
                leftNumberTemp = nil
                self.displayView.text = String(numLeft)
            }
            else {
                switch operTemp! {
                case "/":
                    numLeft /= Int(numberTemp)!
                case "*":
                    numLeft *= Int(numberTemp)!
                case "-":
                    numLeft -= Int(numberTemp)!
                case "+":
                    numLeft += Int(numberTemp)!
                default:
                    return
                }
            }
            displayCount = 0
            leftNumberTemp = nil
            self.displayView.text = String(numLeft)
        }
    }
    
    //화면을 클리어 해주는 함수
    func clear()
    {
        self.displayView.text = "0"
        leftNumberTemp = nil
        displayCount = 0
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

