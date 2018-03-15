//
//  MyCustomClass.swift
//  Coder
//
//  Created by 박소정 on 2018. 3. 15..
//  Copyright © 2018년 sangwook park. All rights reserved.
//

import Foundation

class MyCustomClass: NSObject, NSCoding {
    
    let name: String
    let job: String
    
    init(name: String, job: String) {
        self.name = name
        self.job = job
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: "name")
        aCoder.encode(job, forKey: "job")
    }
    
    required init?(coder aDecoder: NSCoder) {
        name = aDecoder.decodeObject(forKey: "name") as! String
        job = aDecoder.decodeObject(forKey: "job") as! String
    }
    
    override var description: String {
        return name + " : " + job
    }

}
