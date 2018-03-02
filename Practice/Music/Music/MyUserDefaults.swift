//
//  MyUserDefaults.swift
//  Music
//
//  Created by 박소정 on 2018. 2. 27..
//  Copyright © 2018년 sangwook park. All rights reserved.
//

import Foundation

class MyUserDefaults
{
    static var standard: MyUserDefaults = MyUserDefaults()
    func object(forkey defaultName: String) -> Any? {
//        //정보가져오기
//        //만약에 경로상에 파일이 없다면 return nil
//        if let bundlePath = Bundle.main.path(forResource:
//            defaultName, ofType: "plist") {
//            //파일 불러오기
//            if let data = try? Data(contentsOf: URL(fileURLWithPath: bundlePath))
//            {
//                let dic = try? PropertyListSerialization.propertyList(from: data, options: .mutableContainersAndLeaves, format: nil) as! [String:Any]
//                return dic![defaultName]
//            }
//        } else {
//            return nil
//        }
//        return nil
        
        //파일 불러오기
        let rootPath: String = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        //전체경로 저장
        let fullPath: String = rootPath + "/" + defaultName + ".plist"
        
        //파일이 있는지 확인
        if !FileManager.default.fileExists(atPath: fullPath) {
            if let bundlePath: String = Bundle.main.path(forResource: defaultName, ofType: "plist")
            {
                //파일이 없을 때 번들에 있는 파일을 도큐멘트에 복사
                try? FileManager.default.copyItem(atPath: bundlePath, toPath: fullPath)
            }
        }
        
        if let data = try? Data(contentsOf: URL(fileURLWithPath: fullPath))
        {
            do {
                if let dic:[String:Any] = try PropertyListSerialization.propertyList(from: data, options: .mutableContainersAndLeaves, format: nil) as? [String:Any] {
                    return dic
                }
            } catch {
                print("error")
            }
        }
        return nil
    }
    func set(_ value: Any?, forKey defaultName: String)
    {
        //파일 불러오기
        let rootPath: String = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        //전체경로 저장
        let fullPath: String = rootPath + "/" + defaultName + ".plist"
        
        if var dic:[String:Any] = self.object(forkey: defaultName) as? [String:Any] {
            dic.updateValue(value!, forKey: defaultName)
            
            //save
            let newData = try? PropertyListSerialization.data(fromPropertyList: dic, format: .xml, options: 0)
            
            try? newData?.write(to: URL(fileURLWithPath: fullPath))
        }
    }
    func removeObject(forKey defaultName: String)
    {
        //파일 불러오기
        let rootPath: String = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        //전체경로 저장
        let fullPath: String = rootPath + "/" + defaultName + ".plist"
        
        if var dic:[String:Any] = self.object(forkey: defaultName) as? [String:Any] {
            dic.removeValue(forKey: defaultName)
            
            //save
            let newData = try? PropertyListSerialization.data(fromPropertyList: dic, format: .xml, options: 0)
            try? newData?.write(to: URL(fileURLWithPath: fullPath))
        }
    }
    
}
