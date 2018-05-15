//
//  ViewController.swift
//  UIimageViewSample
//
//  Created by 박소정 on 2018. 2. 14..
//  Copyright © 2018년 sangwook park. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //실습코드
        //이미지뷰 생성 및 프레임 설정
        let newImgV = UIImageView(frame:
            CGRect(x: view.bounds.width / 2 - 150, y: 100, width: 300, height: 200))
        
        //이미지 추가
        newImgV.image = UIImage(named:"ho.JPG")
        
        //contentMode 설정
        newImgV.contentMode = UIViewContentMode.scaleAspectFit
        
        //root view에 newImgV를 올린다.
        self.view.addSubview(newImgV)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

