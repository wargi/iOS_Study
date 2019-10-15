//
//  LoginViewController.swift
//  MainProject
//
//  Created by youngmin joo on 2018. 2. 20..
//  Copyright © 2018년 youngmin joo. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {

    //1. tf 2개 필요(아이디//패스워드)
    weak var idTf:UITextField!
    var pwTf:UITextField!
    
    //2. 버튼 2개 필요(로그인 버튼/ 회원가입 버튼)
    var loginBtn:UIButton!
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
        let idTf:UITextField = UITextField()
        idTf.placeholder = "아이디를 입력해주세요"
        idTf.tag = 10
        idTf.delegate = self
        idTf.borderStyle = .line
        idTf.textAlignment = .center
        view.addSubview(idTf)
        self.idTf = idTf
        
        
        pwTf = UITextField()
        pwTf.placeholder = "비밀번호를 입력해주세요"
        pwTf.tag = 11
        pwTf.delegate = self
        pwTf.borderStyle = .line
        pwTf.textAlignment = .center
        pwTf.isSecureTextEntry = true
        pwTf.keyboardType = .phonePad
        view.addSubview(pwTf)
        
        loginBtn = UIButton(type: .custom)
        loginBtn.setTitle("로그인", for: .normal)
        loginBtn.setTitleColor(.black, for: .normal)
        loginBtn.setTitleColor(.gray, for: .highlighted)
        loginBtn.addTarget(self, action: #selector(self.touchUpInsideLoginBtn(_:)), for: .touchUpInside)
        view.addSubview(loginBtn)
        
        signUPBtn = UIButton(type: .custom)
        signUPBtn.setTitle("회원가입", for: .normal)
        signUPBtn.setTitleColor(.black, for: .normal)
        signUPBtn.setTitleColor(.gray, for: .highlighted)
        signUPBtn.addTarget(self, action: #selector(self.touchUpInsideSignUPBtn(_:)), for: .touchUpInside)
        view.addSubview(signUPBtn)
        
    }
    
    //Step2 UP 프레임 잡기
    private func updateLaout()
    {
        var offSetY:CGFloat = 150
        let inpuFrameWidth:CGFloat = view.frame.size.width / 2
        var offsetX:CGFloat = view.frame.size.width/2 - inpuFrameWidth/2
        idTf.frame = CGRect(x: offsetX, y: offSetY, width: inpuFrameWidth, height: 50)
        offSetY += idTf.frame.size.height + 10
        pwTf.frame = CGRect(x: offsetX, y: offSetY, width: inpuFrameWidth, height: 50)
        offSetY += pwTf.frame.size.height + 30
        
        let btnMargin:CGFloat = 10
        loginBtn.frame = CGRect(x: offsetX, y: offSetY, width: (inpuFrameWidth - btnMargin)/2, height: 50)
        offsetX += loginBtn.frame.size.width + btnMargin
        signUPBtn.frame = CGRect(x: offsetX, y: offSetY, width: (inpuFrameWidth - btnMargin)/2, height: 50)
        
    }
    
    @objc private func touchUpInsideLoginBtn(_ sender:UIButton)
    {
        if checkInputValid() && isLogin(userId: idTf.text!, userPW: pwTf.text!)
        {
            UserDefaults.standard.set(idTf.text, forKey: "CurrentUserID")
            self.navigationController?.dismiss(animated: true, completion: nil)
        }
    }
    
    @objc private func touchUpInsideSignUPBtn(_ sender:UIButton)
    {
        print("회원가입")
        let nextVC =  self.storyboard!.instantiateViewController(withIdentifier: "SignupViewController")
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
 
    private func checkInputValid() -> Bool
    {
        //pw체크
        if pwTf.text!.count > 4 {
            return true
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
        }else
        {
            pwTf.resignFirstResponder()
        }
        return true
    }
    
    func isLogin(userId:String, userPW:String) -> Bool
    {
//        let userInfo:[String:String] = ["user_id":id,"user_pw":pw]
                                
//        if UserDataCenter.main.login(userID: userId, userPw: userPW)
//        {
//         
//            return true
//            
//        }else
//        {
//            return false
//        }
        return true
    }
    
    
    
}





