//
//  SignViewController.swift
//  Sign
//
//  Created by 박소정 on 2018. 2. 20..
//  Copyright © 2018년 sangwook park. All rights reserved.
//

import UIKit

let key = "UserList"

class SignViewController: UIViewController, UITextFieldDelegate {
 
    //1. TF 2개 필요(ID, PW)
    var idTF:UITextField!
    var pwTF:UITextField!
    var rePWTF:UITextField!
    var name:UITextField!
    var man:UIButton!
    var girl:UIButton!
    var age:UITextField!
    var tempBtn : UIButton?
    //2. 버튼 2개 필요(Login Button, Sign Button)
    var signBtn:UIButton!
    var cancelBtn:UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        create()
        updateLayout()

    }
    
    private func create()
    {
        idTF = UITextField()
        idTF.placeholder = "아이디를 입력해주세요"
        idTF.tag = 0
        idTF.delegate = self
        idTF.keyboardType = .emailAddress
        idTF.borderStyle = .line
        idTF.textAlignment = .center
        view.addSubview(idTF)
        
        pwTF = UITextField()
        pwTF.placeholder = "비밀번호를 입력해주세요"
        pwTF.tag = 1
        pwTF.delegate = self
        pwTF.isSecureTextEntry = true
        pwTF.keyboardType = .numbersAndPunctuation
        pwTF.borderStyle = .line
        pwTF.textAlignment = .center
        view.addSubview(pwTF)
        
        rePWTF = UITextField()
        rePWTF.placeholder = "비밀번호를 재입력해주세요"
        rePWTF.tag = 2
        rePWTF.delegate = self
        rePWTF.isSecureTextEntry = true
        rePWTF.keyboardType = .numbersAndPunctuation
        rePWTF.borderStyle = .line
        rePWTF.textAlignment = .center
        view.addSubview(rePWTF)
        
        name = UITextField()
        name.placeholder = "이름 입력해주세요"
        name.tag = 3
        name.delegate = self
        name.keyboardType = .namePhonePad
        name.borderStyle = .line
        name.textAlignment = .center
        view.addSubview(name)
        
        age = UITextField()
        age.placeholder = "나이를 입력해주세요"
        age.tag = 4
        age.delegate = self
        age.keyboardType = .numberPad
        age.borderStyle = .line
        age.textAlignment = .center
        view.addSubview(age)
        
        man = UIButton(type: .custom)
        man.setTitle("남", for: .normal)
        man.layer.borderWidth = 1
        man.setTitleColor(.black, for: .normal)
        man.setTitleColor(.red, for: .selected)
        man.addTarget(self, action: #selector(self.touchUpInsideGenderBtn(_:)), for: .touchUpInside)
        view.addSubview(man)
        
        girl = UIButton(type: .custom)
        girl.setTitle("여", for: .normal)
        girl.layer.borderWidth = 1
        girl.setTitleColor(.black, for: .normal)
        girl.setTitleColor(.red, for: .selected)
        girl.addTarget(self, action: #selector(self.touchUpInsideGenderBtn(_:)), for: .touchUpInside)
        view.addSubview(girl)
        
        signBtn = UIButton(type: .custom)
        signBtn.setTitle("가입", for: .normal)
        signBtn.setTitleColor(.black, for: .normal)
        signBtn.setTitleColor(.gray, for: .highlighted)
        signBtn.addTarget(self, action: #selector(self.touchUpInsideSignBtn(_:)), for: .touchUpInside)
        view.addSubview(signBtn)
        
        cancelBtn = UIButton(type: .custom)
        cancelBtn.setTitle("취소", for: .normal)
        cancelBtn.setTitleColor(.black, for: .normal)
        cancelBtn.setTitleColor(.gray, for: .highlighted)
        cancelBtn.addTarget(self, action: #selector(self.touchUpInsideCancelBtn(_:)), for: .touchUpInside)
        view.addSubview(cancelBtn)
    }
    
    private func updateLayout()
    {
        var offsetY : CGFloat = 150
        let inputFrameWidth : CGFloat = view.frame.size.width / 2
        var offsetX : CGFloat = view.frame.size.width / 2 - inputFrameWidth / 2
        idTF.frame = CGRect(x: offsetX, y: offsetY, width: inputFrameWidth, height: 50)
        offsetY += idTF.frame.size.height + 10
        pwTF.frame = CGRect(x: offsetX, y: offsetY, width: inputFrameWidth, height: 50)
        offsetY += idTF.frame.size.height + 10
        rePWTF.frame = CGRect(x: offsetX, y: offsetY, width: inputFrameWidth, height: 50)
        offsetY += idTF.frame.size.height + 10
        name.frame = CGRect(x: offsetX, y: offsetY, width: inputFrameWidth, height: 50)
        offsetY += idTF.frame.size.height + 10
        age.frame = CGRect(x: offsetX, y: offsetY, width: inputFrameWidth, height: 50)
        offsetY += idTF.frame.size.height + 10
        
        man.frame = CGRect(x: offsetX, y: offsetY, width: (inputFrameWidth - 10) / 2, height: 50)
        offsetX += man.frame.size.width + 10
        girl.frame = CGRect(x: offsetX, y: offsetY, width: (inputFrameWidth - 10) / 2, height: 50)
        offsetX = view.frame.size.width / 2 - inputFrameWidth / 2
        offsetY += idTF.frame.size.height + 10
        
        signBtn.frame = CGRect(x: offsetX, y: offsetY, width: (inputFrameWidth - 10) / 2, height: 50)
        offsetX += signBtn.frame.size.width + 10
        cancelBtn.frame = CGRect(x: offsetX, y: offsetY, width: (inputFrameWidth - 10) / 2, height: 50)
    }
    
    @objc private func touchUpInsideSignBtn(_ sender : UIButton) {
        guard error() else { return }
        var idOverlap : Bool = false
//        var listArray = UserDefaults.standard.array(forKey: key) as? [[String:Any]]
        var listArray: [[String: Any]] = (UserDefaults.standard.array(forKey: "User") as? [[String: Any]]) ?? []
        
        for dic in listArray {
            if dic["id"] as? String == idTF.text {
                idOverlap = true
            }
        }
        if idOverlap {
            let overlap : UIAlertController = UIAlertController(title: "OVERLAP", message: "중복된 아이디가 있습니다.", preferredStyle: .alert)
            let overlapAction : UIAlertAction = UIAlertAction(title: "확인", style: .cancel, handler: nil)
            overlap.addAction(overlapAction)
            present(overlap, animated: true, completion: nil)
            idOverlap = false
        }
        else {
            var list: [String: Any] = [:]
            list.updateValue(idTF.text!, forKey: "id")
            list.updateValue(pwTF.text!, forKey: "pw")
            list.updateValue(name.text!, forKey: "name")
            list.updateValue(Int(age.text!)!, forKey: "age")
            listArray.append(list)
            UserDefaults.standard.set(listArray, forKey: "User")
        }
        
    }
    
    @objc private func touchUpInsideCancelBtn(_ sender : UIButton) {
        if let list = UserDefaults.standard.array(forKey: "User") as? [[String:Any]] {
            print(list)
        }
//        else {
            navigationController?.popViewController(animated: true)
//        }
        
    }
    
    @objc private func touchUpInsideGenderBtn(_ sender : UIButton) {
        
        if tempBtn != nil{
            tempBtn!.isSelected = tempBtn!.isSelected ? false : true
            sender.isSelected = sender.isSelected ? false : true
            tempBtn = sender
        } else {
            sender.isSelected = true
            tempBtn = sender
        }
    }
    
    func error() -> Bool {
        //공백 에러
        if idTF.text == nil || pwTF.text == nil || rePWTF.text == nil || name.text == nil || age.text == nil || tempBtn == nil {
            let nilAlert : UIAlertController = UIAlertController(title: "경고", message: "모든정보를 입력하시오.", preferredStyle: .alert)
            let nilAlerAction = UIAlertAction(title: "확인", style: .cancel, handler: nil)
            nilAlert.addAction(nilAlerAction)
            self.present(nilAlert, animated: true, completion: nil)
            
            return false
        }
        
        //패스워드 에러
        if pwTF.text!.count < 4 {
            let alertPW : UIAlertController = UIAlertController(title: "Warring", message: "비밀번호의 길이가 작습니다.", preferredStyle: .alert)
            let alertPWAction = UIAlertAction(title: "확인", style: .cancel, handler: nil)
            alertPW.addAction(alertPWAction)
            self.present(alertPW, animated: true, completion: nil)
            
            return false
        }
        
        //나이 에러
        if Int(age.text!)! > 200 {
            let alertAge : UIAlertController = UIAlertController(title: "Warring", message: "나이를 잘 못 입력하셨습니다.", preferredStyle: .alert)
            let alertAgeAction = UIAlertAction(title: "확인", style: .cancel, handler: nil)
            alertAge.addAction(alertAgeAction)
            self.present(alertAge, animated: true, completion: nil)
            
            return false
        }
        
        //패스워드 재입력 에러
        if pwTF.text != rePWTF.text {
            let alertPW : UIAlertController = UIAlertController(title: "Warring", message: "비밀번호가 같지 않습니다.", preferredStyle: .alert)
            let alertPWAction = UIAlertAction(title: "확인", style: .cancel, handler: nil)
            alertPW.addAction(alertPWAction)
            self.present(alertPW, animated: true, completion: nil)
            
            return false
        }
        
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField.tag {
        case 0:
            pwTF.becomeFirstResponder()
        case 1:
            rePWTF.becomeFirstResponder()
        case 2:
            name.becomeFirstResponder()
        case 3:
            age.becomeFirstResponder()
        default:
            age.resignFirstResponder()
        }
        return true
    }
}
