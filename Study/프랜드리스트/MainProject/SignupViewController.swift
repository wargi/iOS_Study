//
//  SignupViewController.swift
//  MainProject
//
//  Created by youngmin joo on 2018. 2. 20..
//  Copyright © 2018년 youngmin joo. All rights reserved.
//

import UIKit

let USER_LIST = "userList"

class SignupViewController: UIViewController, UITextFieldDelegate {

    //1. tf 2개 필요(아이디//패스워드)
    var idTf:UITextField!
    var pwTf:UITextField!
    var repwTf:UITextField!
    
    //2. 버튼 2개 필요(로그인 버튼/ 회원가입 버튼)
    var backBtn:UIButton!
    var signUPBtn:UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        
        createUI()
        updateLaout()
        
    }
    
    
    //createUI
    //step 1. UI 만들기
    private func createUI()
    {
        idTf = UITextField()
        idTf.placeholder = "아이디를 입력해주세요"
        idTf.tag = 10
        idTf.delegate = self
        idTf.borderStyle = .line
        idTf.textAlignment = .center
        view.addSubview(idTf)
        
        pwTf = UITextField()
        pwTf.placeholder = "비밀번호를 입력해주세요"
        pwTf.tag = 11
        pwTf.delegate = self
        pwTf.borderStyle = .line
        pwTf.textAlignment = .center
        pwTf.isSecureTextEntry = true
        pwTf.keyboardType = .numberPad
        
        let keyboardToolbar = UIToolbar()
        keyboardToolbar.sizeToFit()
        let item = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: self, action:#selector(self.textFieldDone(_:)))
        keyboardToolbar.items = [item,doneBtn]
        
        pwTf.inputAccessoryView = keyboardToolbar
        view.addSubview(pwTf)
        
        repwTf = UITextField()
        repwTf.placeholder = "비밀번호를 다시 입력해주세요"
        repwTf.tag = 12
        repwTf.delegate = self
        repwTf.borderStyle = .line
        repwTf.textAlignment = .center
        repwTf.isSecureTextEntry = true
        repwTf.keyboardType = .numberPad
        repwTf.inputAccessoryView = keyboardToolbar
        view.addSubview(repwTf)
        
        backBtn = UIButton(type: .custom)
        backBtn.setTitle("뒤로", for: .normal)
        backBtn.setTitleColor(.black, for: .normal)
        backBtn.setTitleColor(.gray, for: .highlighted)
        backBtn.addTarget(self, action: #selector(self.touchUpInsideBackBtn(_:)), for: .touchUpInside)
        view.addSubview(backBtn)
        
        signUPBtn = UIButton(type: .custom)
        signUPBtn.setTitle("가입", for: .normal)
        signUPBtn.setTitleColor(.black, for: .normal)
        signUPBtn.setTitleColor(.gray, for: .highlighted)
        signUPBtn.addTarget(self, action: #selector(self.touchUpInsideSignUPBtn(_:)), for: .touchUpInside)
        view.addSubview(signUPBtn)
        
    }
    

    //Step2 UP 프레임 잡기
    private func updateLaout()
    {
        
        backBtn.frame = CGRect(x: 40, y: 30, width: 50, height: 40)
        var offSetY:CGFloat = 150
        let inpuFrameWidth:CGFloat = view.frame.size.width * 2 / 3
        let offsetX:CGFloat = view.frame.size.width/2 - inpuFrameWidth/2
            
        idTf.frame = CGRect(x: offsetX, y: offSetY, width: inpuFrameWidth, height: 40)
        offSetY += idTf.frame.size.height + 10
        pwTf.frame = CGRect(x: offsetX, y: offSetY, width: inpuFrameWidth, height: 40)
        offSetY += pwTf.frame.size.height + 10
        repwTf.frame = CGRect(x: offsetX, y: offSetY, width: inpuFrameWidth, height: 40)
        offSetY += repwTf.frame.size.height + 30
        
        signUPBtn.frame = CGRect(x: offsetX, y: offSetY, width: inpuFrameWidth, height: 45)
        
        
    }
    
    @objc private func touchUpInsideBackBtn(_ sender:UIButton)
    {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc private func touchUpInsideSignUPBtn(_ sender:UIButton)
    {
        
        if checkInputValid() {
            let id:String = idTf.text!
            let pw:String = pwTf.text!
            
            let userInfo:[String:String] = ["user_id":id,"user_pw":pw]
            
            if var userList = UserDefaults.standard.array(forKey: USER_LIST) as? [[String:String]]
            {
                userList.append(userInfo)
                UserDefaults.standard.set(userList, forKey: USER_LIST)
            }else
            {
                var userList:[[String:String]] = []
                userList.append(userInfo)
                UserDefaults.standard.set(userList, forKey: USER_LIST)
            }
            //gotoMain
//            if UserDataCenter.main.login(userID: id, userPw: pw)
//            {
//                self.navigationController?.dismiss(animated: true, completion: nil)
//            }
            
            
        }
    }
    
    
    
    private func checkInputValid() -> Bool
    {
        //pw체크
        if pwTf.text!.count > 4 {
            if pwTf.text == repwTf.text
            {
                return true
            }else
            {
                let alertVC:UIAlertController = UIAlertController(title: "문제야", message: "비밀번호가 매칭되지 않았습니다.", preferredStyle: .alert)
                let action = UIAlertAction(title: "확인", style: .cancel, handler: nil)
                alertVC.addAction(action)
                self.present(alertVC, animated: true, completion: nil)
                
                //
                return false
            }
            
            
        }else
        {
            let alertVC:UIAlertController = UIAlertController(title: "문제야", message: "비밀번호가 너무 짧아 4자리 이상 입력해야돼", preferredStyle: .alert)
            let action = UIAlertAction(title: "확인", style: .cancel, handler: nil)
            alertVC.addAction(action)
            self.present(alertVC, animated: true, completion: nil)
            
            //
            return false
        }
        
    }
    
    
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.tag == 10
        {
            pwTf.becomeFirstResponder()
        }else if textField.tag == 11
        {
            repwTf.becomeFirstResponder()
        }else
        {
            textField.resignFirstResponder()
        }
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        print(textField.tag)
    }
    
    
    @objc func textFieldDone(_ sender: UIBarButtonItem)
    {
        self.view.endEditing(true)
    }

}
