//
//  ViewController.swift
//  JsonTest
//
//  Created by 박소정 on 2018. 3. 21..
//  Copyright © 2018년 sangwook park. All rights reserved.
//

/*
 
 */
import UIKit

class ViewController: UIViewController {
    
    let jsonObject: [String:Any] = [
        "id": "0001",
        "type": "donut",
        "name": "Cake",
        "ppu": 0.55,
        "batters":
            [
                "batter":
                    [
                        [ "id": "1001", "type": "Regular" ],
                        [ "id": "1002", "type": "Chocolate" ],
                        [ "id": "1003", "type": "Blueberry" ],
                        [ "id": "1004", "type": "Devil's Food" ]
                ]
        ],
        "topping":
            [
                [ "id": "5001", "type": "None" ],
                [ "id": "5002", "type": "Glazed" ],
                [ "id": "5005", "type": "Sugar" ],
                [ "id": "5007", "type": "Powdered Sugar" ],
                [ "id": "5006", "type": "Chocolate with Sprinkles" ],
                [ "id": "5003", "type": "Chocolate" ],
                [ "id": "5004", "type": "Maple" ]
        ]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard JSONSerialization.isValidJSONObject(jsonObject) else {
            print("No JsonFile")
            return
        }
        
        do {
            let encoder = try JSONSerialization.data(withJSONObject: jsonObject)
            let decoder = try JSONSerialization.jsonObject(with: encoder)
            
            if let jsonDict = decoder as? [String:Any] {
                print(jsonObject)
            }
        } catch {
            print(error.localizedDescription)
        }
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

