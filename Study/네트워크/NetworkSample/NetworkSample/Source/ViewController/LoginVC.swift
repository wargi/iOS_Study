//
//  ViewController.swift
//  NetworkSample
//
//  Created by 박소정 on 2018. 3. 27..
//  Copyright © 2018년 sangwook park. All rights reserved.
//

import UIKit
import Alamofire

class LoginVC: UIViewController {

    @IBOutlet private weak var userID : UITextField!
    @IBOutlet private weak var userPW : UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.navigationController?.navigationBar.isHidden = true
        
    }

    @IBAction private func signIn(_ sender: UIButton) {
        let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "MainVC") as! MainVC
        
        let param = [
            "username": "sejun1",
            "password": "sejun1"
        ]
 
        Alamofire.request(FastURL.authToken, method: .post, parameters: param)
            .responseData { (response) in
                switch response.result {
                case .success(let data):
                    let data = try! JSONDecoder().decode(Auth.self, from: data)
                    nextVC.token = data.token
                case .failure(let error):
                    print(error.localizedDescription)
                }
        }
        
        let alert = UIAlertController(title: "Login", message: "로그인 성공 !!", preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK", style: .default) { (_) in
            self.navigationController?.pushViewController(nextVC, animated: true)
        }
        
        alert.addAction(alertAction)
        self.present(alert, animated: true, completion: nil)
    }

    
    @IBAction private func signUp(_ sender: UIButton) {
        let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "SignUpVC") as! SignUpVC
        self.navigationController?.pushViewController(nextVC, animated: true)
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

