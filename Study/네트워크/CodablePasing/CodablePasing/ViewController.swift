//
//  ViewController.swift
//  CodablePasing
//
//  Created by 박소정 on 2018. 3. 22..
//  Copyright © 2018년 sangwook park. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let apiURL = URL(string: "https://api.github.com/search/repositories?q=language:swift+user:baeraemo")!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let task = URLSession.shared.dataTask(with: apiURL) { (data, response, error) in
            guard let response = response as? HTTPURLResponse, let data = data else { return }
            guard 200..<400 ~= response.statusCode else { return }
            do {
                let repositories = try JSONDecoder().decode(Repository.self, from: data)
                print(repositories.repositoryCount)
                for repository in repositories.items {
                    print(repository.fullName)
                    print(repository.description ?? "")
                }
            } catch {
                print(error.localizedDescription)
            }
        }
        task.resume()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

struct Repository: Decodable {
    let repositoryCount: Int
    let items: [Github]
    
    enum CodingKeys: String, CodingKey {
        case repositoryCount = "total_count"
        case items
    }
    struct Github: Decodable {
        let fullName: String
        let description: String?
        let starCount: Int
        let forkCount: Int
        let url: String
        
        enum CodingKeys: String, CodingKey {
            case fullName = "full_name"
            case description = "description"
            case starCount = "stargazers_count"
            case forkCount = "forks_count"
            case url = "html_url"
        }
    }
}


