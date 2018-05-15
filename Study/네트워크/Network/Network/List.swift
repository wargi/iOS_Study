//
//  List.swift
//  Network
//
//  Created by 박소정 on 2018. 3. 27..
//  Copyright © 2018년 sangwook park. All rights reserved.
//

import Foundation
import UIKit


struct List: Codable {
    let title: String
    let img_cover: String?
    let content: String
    let created_date: String
    
    enum codingKey: String, CodingKey {
        case title
        case img_cover = "img_cover"
        case content
        case created_date  = "created_date"
    }
}
