
//  File.swift
//  Network
//
//  Created by 박소정 on 2018. 3. 27..
//  Copyright © 2018년 sangwook park. All rights reserved.
//

import Foundation

struct UserInfomation: Codable {
    let user: User
    let token: String
}
struct User: Codable {
    enum codingKey: String, CodingKey {
        case pk
        case username
        case firstName = "first_name"
        case lastName = "last_name"
        case email
    }
    
    let pk: Int
    let username: String
    let firstName: String?
    let lastName: String?
    let email: String?
}




