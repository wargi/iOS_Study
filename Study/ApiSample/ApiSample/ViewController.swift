//
//  ViewController.swift
//  ApiSample
//
//  Created by 박소정 on 2018. 3. 21..
//  Copyright © 2018년 sangwook park. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let apiURL = URL(string: "http://api.open-notify.org/astros.json")!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let dataTask = URLSession.shared.dataTask(with: apiURL) { (data, response, error) in
            guard error == nil else {
                print(error!.localizedDescription)
                return
            }
            guard let response = response as? HTTPURLResponse, 200..<400 ~= response.statusCode else {
                print("StatusCode is not Valid")
                return
            }
            guard let data = data,
                let jsonObject = try? JSONSerialization.jsonObject(with: data) as! [String: Any]
                else {
                print("No Data")
                return
            }
//            print(jsonObject)
            guard (jsonObject["message"] as? String) == "success",
            let people = jsonObject["people"] as? [[String: String]],
            let peopleCount = jsonObject["number"] as? Int
            else {
                print("Parsing Error")
                return
            }
            
            print("총 \(peopleCount)명의 우주비행사가 탑승 중입니다.")
            
            print("\n= 우주비행사 명단 =\n")
            people
                .flatMap { $0["name"] }
                .forEach { print($0) }
        }
        
        dataTask.resume() //Activate 상태가 아닐때 해주어야 한다.
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

