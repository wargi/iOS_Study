//
//  UserInfomation.swift
//  NetworkSample
//
//  Created by 박소정 on 2018. 3. 27..
//  Copyright © 2018년 sangwook park. All rights reserved.
//

import Foundation

struct Auth: Decodable {
    let user: User
    let token: String
}

struct User: Decodable {
    let username: String
    
    enum codingKey: String, CodingKey {
        case username = "username"
    }
}

struct List: Decodable {
    let title: String
    let img_cover: String?
    let content: String
    let created_date: String
}
