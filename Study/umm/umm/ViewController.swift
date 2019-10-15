//
//  ViewController.swift
//  umm
//
//  Created by 박소정 on 2018. 3. 21..
//  Copyright © 2018년 sangwook park. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let jsonObject = """
    {
        "id": "0001",
        "type": "donut",
        "name": "Cake",
        "ppu": 0.55,
        "batters":
        {
            "batter":
            [
            { "id": "1001", "type": "Regular" },
            { "id": "1002", "type": "Chocolate" },
            { "id": "1003", "type": "Blueberry" },
            { "id": "1004", "type": "Devil's Food" }
            ]
        },
        "topping":
        [
        { "id": "5001", "type": "None" },
        { "id": "5002", "type": "Glazed" },
        { "id": "5005", "type": "Sugar" },
        { "id": "5007", "type": "Powdered Sugar" },
        { "id": "5006", "type": "Chocolate with Sprinkles" },
        { "id": "5003", "type": "Chocolate" },
        { "id": "5004", "type": "Maple" }
        ]
    }
    """
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let jsonData = jsonObject.data(using: .utf8)!
        
        do {
            
            let foundationObject = try JSONSerialization.jsonObject(with: jsonData)
            if let jsonDict = foundationObject as? [String: Any] {
                print(jsonDict)
            }
        } catch {
            print(error.localizedDescription)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

