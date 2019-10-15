//
//  ViewController.swift
//  UIDeviceTest
//
//  Created by 박소정 on 2018. 3. 26..
//  Copyright © 2018년 sangwook park. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let device = UIDevice.current
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(device.systemName)
        print((device.systemVersion as NSString).floatValue)
        
        let systemVersion = device.systemVersion
        print(systemVersion)
        
        let splitVersion = systemVersion.split(separator: ".").flatMap({Int($0)})
        
        architecture()
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    func architecture() {
        #if (arch(i386) || arch(x86_64) && arch(arm))
            print("Simulator")
        #else
            print("Device")
        #endif
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

