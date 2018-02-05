//
//  ViewController.swift
//  UISample
//
//  Created by 박상욱 on 2018. 2. 1..
//  Copyright © 2018년 sangwook park. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var isSelect:[UIButton] = []
    var titleLB:UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let topMargin = 100
        titleLB = UILabel(frame: CGRect(x: 0, y: topMargin, width: Int(view.bounds.size.width), height: topMargin))
        titleLB.text = ""
        titleLB.font = UIFont.systemFont(ofSize: 50)
        titleLB.textAlignment = .center
        titleLB.textColor = UIColor.darkGray
        view.addSubview(titleLB)
        
        let centerLB:UILabel = UILabel(frame: CGRect(x: 0, y: topMargin*2, width: Int(view.bounds.size.width), height: topMargin*3))
        centerLB.text =
        """
        호우주의보
        """
        centerLB.lineBreakMode = .byCharWrapping
        centerLB.font = UIFont.systemFont(ofSize: 50)
        centerLB.textColor = UIColor.red
        centerLB.textAlignment = .center
        centerLB.numberOfLines = 3
        view.addSubview(centerLB)
        
        let hoImage:UIImage? = UIImage(named: "ho.JPG")
        let bgImgView: UIImageView = UIImageView(frame: CGRect(x: 0, y: self.view.bounds.size.height - 280, width: view.bounds.size.width, height: 285))
        bgImgView.image = hoImage
        bgImgView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        bgImgView.contentMode = UIViewContentMode.scaleAspectFit
        view.addSubview(bgImgView)
        let logoBtn: UIButton = UIButton(type: .custom)
        logoBtn.frame = CGRect(x: 25, y: 25, width: 50, height: 50)
        logoBtn.setTitle("왼쪽", for: .normal)
        logoBtn.setTitleColor(UIColor.black, for: .selected)
        logoBtn.backgroundColor = .black
        logoBtn.tag = 1
        logoBtn.addTarget(self, action: #selector(self.logoEventTouchUpInside(_:)), for: .touchUpInside)
        view.addSubview(logoBtn)
        
        let logoBtn2:UIButton = UIButton(type: .custom)
        logoBtn2.frame = CGRect(x: 75, y: 25, width: 50, height: 50)
        logoBtn2.setTitle("가운데", for: .normal)
        logoBtn2.setTitleColor(.black, for: .selected)
        logoBtn2.backgroundColor = .black
        logoBtn2.tag = 2
        logoBtn2.addTarget(self, action: #selector(self.logoEventTouchUpInside(_:)), for: .touchUpInside)
        view.addSubview(logoBtn2)
        
        let logoBtn3:UIButton = UIButton(type: .custom)
        logoBtn3.frame = CGRect(x: 125, y: 25, width: 50, height: 50)
        logoBtn3.setTitle("오른쪽", for: .normal)
        logoBtn3.setTitleColor(UIColor.black, for: .selected)
        logoBtn3.backgroundColor = UIColor.black
        logoBtn3.tag = 3
        logoBtn3.addTarget(self, action: #selector(self.logoEventTouchUpInside(_:)), for: .touchUpInside)
        view.addSubview(logoBtn3)
        
        let resultBtn:UIButton = UIButton(type: .custom)
        resultBtn.frame = CGRect(x: 175, y: 25, width: 50, height: 50)
        resultBtn.setTitle("결과", for: .normal)
        resultBtn.setTitleColor(.white, for: .normal)
        resultBtn.backgroundColor = UIColor.red
        resultBtn.addTarget(self, action: #selector(self.logoTagReturnEventTouchUpInside), for: .touchUpInside)
        view.addSubview(resultBtn)
//        let titleLB:UILabel = UILabel(frame: CGRect(x: 0, y: 100, width: view.frame.size.width, height: 150))
//        titleLB.text = "UI Test View"
//        titleLB.textAlignment = .center
//        titleLB.textColor = UIColor.gray
//        titleLB.font = UIFont.systemFont(ofSize: 50)
//        self.view.addSubview(titleLB)
//
//        let centerLB:UILabel = UILabel(frame : CGRect(x: 0, y: 250, width: view.frame.size.width, height: 300))
//
//        centerLB.text =
//        """
//        중간에 표시되는 텍스트를 길게
//        작성 해볼까요?
//        여러줄을 표시 할 수 있습니다.
//        이렇게
//        """
//
//        centerLB.textAlignment = .center
//        centerLB.font = UIFont.systemFont(ofSize: 30)
//        centerLB.textColor = .blue
//        centerLB.numberOfLines = 0
//        centerLB.sizeToFit()
//        centerLB.lineBreakMode = NSLineBreakMode.byWordWrapping
//        view.addSubview(centerLB)
        
        
    }

    @objc func logoEventTouchUpInside(_ sender:UIButton)
    {
        if isSelect.contains(sender) {
            for arr in isSelect {
                if arr == sender && arr.isSelected == true {
                    arr.isSelected = false
                } else if arr == sender && arr.isSelected == false
                {
                    arr.isSelected = true
                }
            }
            
        } else
        {
            sender.isSelected = true
            isSelect.append(sender)
        }
    }
    
    @objc func logoTagReturnEventTouchUpInside()
    {
        guard isSelect.count != 0 else { return }
        
        var count:Int = 0
        
        for arr in isSelect
        {
            if arr.isSelected
            {
                count += arr.tag
            }
        }
        titleLB.text = String(count)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

