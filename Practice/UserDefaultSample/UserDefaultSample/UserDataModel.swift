//
//  UserDataModel.swift
//  UserDefaultSample
//
//  Created by 박상욱 on 2018. 2. 26..
//  Copyright © 2018년 sangwook park. All rights reserved.
//


//아이디
//비밀번호
//이메일
//생일
//성별

import Foundation

enum Gender:Int {
    case Man = 0
    case Girl = 1
}

struct UserDataModel {
    var userID: String
    var userPW: String
    var email: String
    var birthday: String?
    var gender: Gender?
    
    var friendList: [UserDataModel] = []
    
    init?(dic:[String:Any])
    {
        guard let id = dic["userID"] as? String,
            let pw = dic["userPW"] as? String,
            let email = dic["email"] as? String else { return nil }
        
        self.userID = id
        self.userPW = pw
        self.email = email
        
        self.birthday = dic["birthday"] as? String
        if let genderNum = dic["gender"] as? Int {
            self.gender = Gender(rawValue: genderNum)
        }
//        
//        if let list = dic["friendList"] as? dic[[String:Any]] {
//            
//        }
//        self.gender = dic["gender"] as? Int
    }
}
