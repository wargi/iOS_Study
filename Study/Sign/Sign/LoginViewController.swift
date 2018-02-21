//
//  LoginViewController.swift
//  Sign
//
//  Created by 박소정 on 2018. 2. 20..
//  Copyright © 2018년 sangwook park. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {

    //1. TF 2개 필요(ID, PW)
    var idTF:UITextField!
    var pwTF:UITextField!
    
    //2. 버튼 2개 필요(Login Button, Sign Button)
    var loginBtn:UIButton!
    var signUPBtn:UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        createUI()
        updateLayout()
    }
    
    //CreateUI
    //Step 1 UI 만들기
    private func createUI()
    {
        idTF = UITextField()
        idTF.placeholder = "아이디를 입력해주세요"
        idTF.tag = 10
        idTF.delegate = self
        idTF.borderStyle = .line
        idTF.textAlignment = .center
        view.addSubview(idTF)
        
        pwTF = UITextField()
        pwTF.placeholder = "비밀번호를 입력해주세요"
        pwTF.tag = 10
        pwTF.delegate = self
        pwTF.isSecureTextEntry = true
        pwTF.keyboardType = .numbersAndPunctuation
        pwTF.borderStyle = .line
        pwTF.textAlignment = .center
        view.addSubview(pwTF)
        
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
    
    
    @objc private func touchUpInsideLoginBtn(_ sender : UIButton) {
        guard checkLogin() else { return }
        
    }
    
    func checkLogin() -> Bool {
        var checkLoginNumber : Int = 0
        let infoArr = (UserDefaults.standard.array(forKey: "User") as? [[String: Any]]) ?? []
            for info in infoArr
            {
                //정상적인 로그인
                if (info["id"] as? String) == idTF.text
                {
                    checkLoginNumber = info["pw"] as? String == pwTF.text ? 0 : 1
                }
                //Login Error
                else
                {
                    checkLoginNumber = 2
                }
            }
        
        switch checkLoginNumber {
        case 0:
            let login : UIAlertController = UIAlertController(title: "success", message: "로그인 되었습니다.", preferredStyle: .alert)
            let loginAction : UIAlertAction = UIAlertAction(title: "확인", style: .cancel, handler: { (_) in
                self.dismiss(animated: true, completion: nil)
            })
            login.addAction(loginAction)
            present(login, animated: true, completion: nil)
            return true
        case 1:
            let pwError : UIAlertController = UIAlertController(title: "비밀번호 오류", message: "비밀번호가 틀렸습니다.", preferredStyle: .alert)
            let pwErrorAction : UIAlertAction = UIAlertAction(title: "확인", style: .cancel, handler : nil)
            pwError.addAction(pwErrorAction)
            present(pwError, animated: true, completion: nil)
            return false
        case 2:
            let idError : UIAlertController = UIAlertController(title: "로그인 오류", message: "가입된 아이디가 없습니다.", preferredStyle: .alert)
            let idErrorAction : UIAlertAction = UIAlertAction(title: "확인", style: .cancel, handler: nil)
            idError.addAction(idErrorAction)
            present(idError, animated: true, completion: nil)
            return false
        default:
            print("nil")
            return false
        }
    }

    @objc private func touchUpInsideSignUPBtn(_ sender : UIButton) {
        let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "touchUpInsideCancelBtn")
        self.navigationController?.pushViewController(nextVC!, animated: true)
        

        
    }
    
    private func checkInputValid() -> Bool
    {
//        if pwTF.text!.count > 4
//        {
//            return true
//        }
//        else
//        {
//            let alertVC : UIAlertController = UIAlertController(title: "뮨제야", message: "비밀번호가 너무 짧아 4자리 이상 입력해야돼", preferredStyle: .alert)
//            let action = UIAlertAction(title: "확인", style: .cancel, handler: nil)
//            alertVC.addAction(action)
//            self.present(alertVC, animated: true, completion: nil)
//            return false
//        }
        

        return true
    }

    //Step2 UP Frame 잡기
    private func updateLayout()
    {
        var offsetY : CGFloat = 150
        let inputFrameWidth : CGFloat = view.frame.size.width / 2
        var offsetX : CGFloat = view.frame.size.width / 2 - inputFrameWidth / 2
        idTF.frame = CGRect(x: offsetX, y: offsetY, width: inputFrameWidth, height: 50)
        offsetY += idTF.frame.size.height + 10
        pwTF.frame = CGRect(x: offsetX, y: offsetY, width: inputFrameWidth, height: 50)
        offsetY += idTF.frame.size.height + 30
        
        loginBtn.frame = CGRect(x: offsetX, y: offsetY, width: (inputFrameWidth - 10) / 2, height: 50)
        offsetX += loginBtn.frame.size.width + 10
        signUPBtn.frame = CGRect(x: offsetX, y: offsetY, width: (inputFrameWidth - 10) / 2, height: 50)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.tag == 10 {
            pwTF.becomeFirstResponder()
        }
        else {
            pwTF.resignFirstResponder()
        }
        return true
    }
}
