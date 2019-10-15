//
//  URL.swift
//  NetworkSample
//
//  Created by 박소정 on 2018. 3. 27..
//  Copyright © 2018년 sangwook park. All rights reserved.
//

import Foundation
import Alamofire

struct FastURL {
    static let singUpURL = URL(string: "https://api.lhy.kr/members/signup/")!
    static let authToken = URL(string: "https://api.lhy.kr/members/auth-token/")!
    static let profile = URL(string: "https://api.lhy.kr/members/profile/")!
    static let postCreate = URL(string: "https://api.lhy.kr/posts/")!
    static let postList = URL(string: "https://api.lhy.kr/posts/")!
}

final class RequestClass {
    var data: Data!
    
    func getData(fastURL: URL, param: Parameters? = nil, completion: @escaping (DataResponse<Data>) -> Void) {
        Alamofire.request(fastURL, method: .get, parameters: param)
            .responseData(completionHandler: completion)
    }
    
    func postData(fastURL: URL, param: Parameters? = nil, header: HTTPHeaders? = nil, completion: @escaping (DataResponse<Data>) -> Void) {
        if let head = header {
            Alamofire
                .request(fastURL, method: .post, parameters: param, headers: head)
                .responseData(completionHandler: completion)
        } else {
            Alamofire.request(fastURL, method: .post, parameters: param)
                .responseData(completionHandler: completion)
        }
    }
}
