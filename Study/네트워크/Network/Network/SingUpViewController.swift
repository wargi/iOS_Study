//
//  SingUpViewController.swift
//  Network
//
//  Created by 박소정 on 2018. 3. 27..
//  Copyright © 2018년 sangwook park. All rights reserved.
//

import UIKit
import Alamofire

class SingUpViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let params: Parameters = [
            "username":"sejun1",
            "password":"sejun1",
            "first_name":"sangwook",
            "last_name":"park",
            "email":"wkahdla123@naver.com"
        ]
        let token = "myToken"
        let header = ["Authorization":"Token \(token)"]
        
        Alamofire.request(URL(string: "https://api.lhy.kr/members/signup/")!, method: .post, parameters: params)
            .validate()
}
// Do any additional setup after loading the view.

override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
}


/*
 // MARK: - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
 // Get the new view controller using segue.destinationViewController.
 // Pass the selected object to the new view controller.
 }
 */

}
