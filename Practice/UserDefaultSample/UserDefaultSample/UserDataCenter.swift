//
//  File.swift
//  UserDefaultSample
//
//  Created by 박상욱 on 2018. 2. 26..
//  Copyright © 2018년 sangwook park. All rights reserved.
//

import Foundation

class UserDataCenter
{
    static var main : UserDataCenter = UserDataCenter()
    
    var isLogin:Bool?
    
    private var userList:[String] = []
    
    func login(userID:String, userPW:String) -> Bool {
        return true
    }
    
}
