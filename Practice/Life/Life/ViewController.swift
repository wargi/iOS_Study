//
//  ViewController.swift
//  Life
//
//  Created by 박상욱 on 2018. 2. 5..
//  Copyright © 2018년 sangwook park. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    var tf:UITextField!
    var resultLB:UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createBG()
        
        let btn = UIButton(frame : CGRect(x: view.frame.maxX / 2 - 40, y: view.frame.maxY - 120, width: 80, height: 30))
        btn.addTarget(self, action: #selector(self.btnHandlner(_:)), for: .touchUpInside)
        btn.setTitle("놀러와", for: .normal)
        btn.setTitleColor(.blue, for: .normal)
        view.addSubview(btn)
        
        tf = UITextField(frame: CGRect(x: view.frame.maxX / 2 - 100, y: view.frame.maxY - 185, width: 200, height: 50))
        tf.borderStyle = .line
        tf.font = UIFont.systemFont(ofSize: 30)
        tf.textColor = .white
        tf.placeholder = "안녕하세요"
        tf.delegate = self
        view.addSubview(tf)
        
        resultLB = UILabel(frame: CGRect(x: view.frame.maxX / 2 - 100, y: view.frame.maxY - 250, width: 200, height: 50))
        resultLB.textColor = .white
        resultLB.textAlignment = .center
        resultLB.font = UIFont.systemFont(ofSize: 30)
        resultLB.layer.borderWidth = 1
        view.addSubview(resultLB)
    }
    
    func  createBG() {
        let image1 : UIImage = UIImage(named: "AppleLogo")!
        let image2 : UIImage = UIImage(named: "JJ.jpg")!
        let width : CGFloat = 120
        let centerX = view.frame.maxX / 2 - width / 2
        let bgImage : UIImageView = UIImageView(image: image1)
        let bgImage2 : UIImageView = UIImageView(image: image2)
        
        bgImage.contentMode = .scaleAspectFit
        bgImage.alpha = 0.8
        bgImage.frame = CGRect(x: centerX, y: 30, width: width, height: width)
        
        bgImage2.contentMode = .scaleAspectFit
        bgImage2.alpha = 1
        bgImage2.frame = view.bounds
        
        self.view.addSubview(bgImage2)
        self.view.addSubview(bgImage)
        
        let title : UILabel = UILabel(frame: CGRect(x:centerX , y: view.frame.maxY - width, width: width, height: width))
        title.text = "UI 실습"
        title.font = UIFont.boldSystemFont(ofSize: 40)
        title.textColor = UIColor.black
        title.textAlignment = .center
        self.view.addSubview(title)
        
        
    }
    
    @objc func btnHandlner(_ sender : UIButton) {
        resultLB.text = tf.text
        tf.text = ""
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print(tf.isFirstResponder)
        tf.resignFirstResponder()
        
        return false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

