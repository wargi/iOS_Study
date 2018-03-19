//
//  ViewController.swift
//  Chapter02-InputForm
//
//  Created by 박소정 on 2018. 3. 18..
//  Copyright © 2018년 sangwook park. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var paramEmail: UITextField!
    var paramUpdate: UISwitch!
    var paramInterval: UIStepper!
    var txtUpdate: UILabel!
    var txtInterval: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 1. 네비게이션 컨트롤러 설정
        self.navigationItem.title = "설정"
        
        let submitBtn = UIBarButtonItem(barButtonSystemItem: .compose, target: self, action: #selector(submit(_:)))
        self.navigationItem.rightBarButtonItem = submitBtn
        
        // 2.
        var offsetX = 30
        var offsetY = 100
        
        let lblEmail = UILabel()
        lblEmail.frame = CGRect(x: offsetX, y: offsetY, width: 100, height: 30)
        lblEmail.text = "이메일"
        lblEmail.font = .systemFont(ofSize: 14)
        
        let lblUpdate = UILabel()
        
        lblUpdate.frame = CGRect(x: offsetX, y: offsetY + 50, width: 100, height: 30)
        lblUpdate.text = "자동갱신"
        lblUpdate.font = .systemFont(ofSize: 14)
        
        let lblInterval = UILabel()
        lblInterval.frame = CGRect(x: offsetX, y: offsetY + 100, width: 100, height: 30)
        lblInterval.text = "갱신주기"
        lblInterval.font = .systemFont(ofSize: 14)
        
        self.paramEmail = UITextField()
        self.paramEmail.frame = CGRect(x: offsetX + 90, y: offsetY, width: 220, height: 30)
        self.paramEmail.font = .systemFont(ofSize: 13)
        self.paramEmail.borderStyle = .roundedRect
        self.paramEmail.placeholder = "이메일 예) sqlpro@naver.com"
        self.paramEmail.autocapitalizationType = .none
        
        self.paramUpdate = UISwitch()
        self.paramUpdate.frame = CGRect(x: offsetX + 90, y: offsetY + 50, width: 50, height: 30)
        self.paramUpdate.setOn(true, animated: true)
        self.paramUpdate.addTarget(self, action: #selector(self.presentUpdateValue(_:)),
                                   for: .valueChanged)
        
        self.paramInterval = UIStepper()
        self.paramInterval.frame = CGRect(x: offsetX + 90, y: offsetY + 100, width: 50, height: 30)
        self.paramInterval.minimumValue = 0
        self.paramInterval.maximumValue = 100
        self.paramInterval.stepValue = 1
        self.paramInterval.value = 0
        self.paramInterval.addTarget(self, action: #selector(self.presentIntervalValue(_:)),
                                     for: .valueChanged)
        
        self.txtUpdate = UILabel()
        self.txtUpdate.frame = CGRect(x: offsetX + 220, y: offsetY + 50, width: 100, height: 30)
        self.txtUpdate.textColor = .red
        self.txtUpdate.text = "갱신함"
        
        self.txtInterval = UILabel()
        self.txtInterval.frame = CGRect(x: offsetX + 220, y: offsetY + 100, width: 100, height: 30)
        self.txtInterval.font = .systemFont(ofSize: 12)
        self.txtInterval.textColor = .red
        self.txtInterval.text = "0분마다"
        
        self.view.addSubview(lblEmail)
        self.view.addSubview(lblUpdate)
        self.view.addSubview(lblInterval)
        self.view.addSubview(paramEmail)
        self.view.addSubview(paramUpdate)
        self.view.addSubview(paramInterval)
        self.view.addSubview(txtUpdate)
        self.view.addSubview(txtInterval)
    }

    @objc func presentUpdateValue(_ sender: UISwitch) {
        self.txtUpdate.text = (sender.isOn ? "갱신함" : "갱신하지 않음")
    }
    
    @objc func presentIntervalValue(_ sender: UIStepper) {
        self.txtInterval.text = ("\(Int(sender.value))분마다")
    }
    
    @objc func submit(_ sender: UIButton) {
        let rvc = ReadViewController()
        rvc.pEmail = self.paramEmail.text
        rvc.pUpdate = self.paramUpdate.isOn
        rvc.pInterval = self.paramInterval.value
        
        self.navigationController?.pushViewController(rvc, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

