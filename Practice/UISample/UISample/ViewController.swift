//
//  ViewController.swift
//  UISample
//
//  Created by 박소정 on 2018. 2. 1..
//  Copyright © 2018년 sangwook park. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let topMargin = 100
        let titleLB:UILabel = UILabel(frame: CGRect(x: 0, y: topMargin, width: Int(view.bounds.size.width), height: topMargin))
        titleLB.text = "오늘의 날씨"
        titleLB.font = UIFont.systemFont(ofSize: 50)
        titleLB.textAlignment = .center
        titleLB.textColor = UIColor.darkGray
        view.addSubview(titleLB)
        
        let centerLB:UILabel = UILabel(frame: CGRect(x: 0, y: topMargin*2, width: Int(view.bounds.size.width), height: topMargin*3))
        centerLB.text =
        """
        날씨 : 맑음
        온도 : -3도
        강수확율 : 10%
        쓸데 없는 말
        """
        centerLB.lineBreakMode = .byCharWrapping
        centerLB.font = UIFont.systemFont(ofSize: 30)
        centerLB.textColor = UIColor.red
        centerLB.textAlignment = .center
        centerLB.numberOfLines = 3
        view.addSubview(centerLB)
        
        let hoImage:UIImage? = UIImage(named: "ho.JPG")
        let bgImgView: UIImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: <#T##CGFloat#>, height: <#T##CGFloat#>))
        bgImgView.image = hoImage
        bgImgView.backgroundColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        bgImgView.alpha = 0.1
        bgImgView.contentMode = UIViewContentMode.scaleAspectFit
        view.addSubview(bgImgView)
        // Do any additional setup after loading the view, typically from a nib.
        
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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

