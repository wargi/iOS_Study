//
//  ViewController.swift
//  EnumTest
//
//  Created by 박상욱 on 2018. 2. 27..
//  Copyright © 2018년 sangwook park. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let upC = Barcode.upc(1, 2, 3, 4)
        
        switch upC {
            case .upc(let a, let b, let c, let d):
                print("upc: \(a), \(b), \(c), \(d)")
            case .qrCode(let str):
                print("QR code: \(str)")
        }
        
        
        let woodenHelmetProps = Wearable.Helmet(weight: .Light, armor: .Light).attributes()
        print (woodenHelmetProps)
        let possiblePlanet:Planet? = Planet(rawValue: 3)
        print(possiblePlanet!)
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

