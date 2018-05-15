//
//  ViewController.swift
//  Network
//
//  Created by 박소정 on 2018. 3. 27..
//  Copyright © 2018년 sangwook park. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    @IBOutlet private weak var username : UITextField!
    @IBOutlet private weak var password : UITextField!
    let baseURL: URL = URL(string: "https://api.lhy.kr/members/auth-token/")!
    
    var token:String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction private func ok(_ sender: UIButton) {
        let param:Parameters = [
            "username": "sejun1",
            "password": "sejun1"
        ]
        
        Alamofire.request(baseURL, method: .post, parameters: param)
            .validate()
            .responseData { (response) in
                switch response.result {
                case .success(let value):
                    let userInfo = try! JSONDecoder().decode(UserInfomation.self, from: value)
                    self.dataList(token: userInfo.token)
                case .failure(let error):
                    print(error.localizedDescription)
                }
        }
    }
    
    func dataList(token: String) {
        Alamofire.request(URL(string: "https://api.lhy.kr/posts/")!, method: .get)
            .responseData { (response) in
                switch response.result {
                case .success(let arr):
                    let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "MainViewController") as! MainViewController
                    let array = try! JSONDecoder().decode([List].self, from: arr)
                    nextVC.dataList = array
                    nextVC.token = token
                    self.present(nextVC, animated: true, completion: nil)
                case .failure(let error):
                    print(error.localizedDescription)
                }
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

