//
//  MyUserDefault.swift
//  Project
//
//  Created by 박상욱 on 2018. 2. 28..
//  Copyright © 2018년 sangwook park. All rights reserved.
//

import Foundation

class MyUserDefault
{
    let fileName = "myUserDefault.plist"
    private var fullPath:String
    private var fileURL:URL
    
    static var standard: MyUserDefault = MyUserDefault()
    
    private init()
    {
        //1. 경로 찾기
        let directoryPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        fullPath = directoryPath + "/" + fileName
        fileURL = URL(fileURLWithPath: fullPath)
    }
    
    //키값을 받아서 해당 키값의 벨류를 리턴해주는 함수
    func object(forKey defaultName: String) -> Any?
    {
        
        if !FileManager.default.fileExists(atPath: fullPath)
        {
            return nil
        }
        
        let data = try! Data(contentsOf: fileURL)
        let propetyList =  try! PropertyListSerialization.propertyList(from: data, options: .mutableContainersAndLeaves, format: nil)
        
        //크래쉬가 날 경우 set메소드 로직 에러!!
        let dic = propetyList as! [String:Any?]
        if let value = dic[defaultName]
        {
            return value
        }else
        {
            return nil
        }
        
    }
    
    
    func set(_ value: Any?, forKey defaultName: String)
    {
        
        var dic:[String:Any?]!
        
        if FileManager.default.fileExists(atPath: fullPath)
        {
            let data = try! Data(contentsOf: fileURL)
            let propetyList =  try! PropertyListSerialization.propertyList(from: data, options: .mutableContainersAndLeaves, format: nil)
            dic = propetyList as! [String:Any?]
            dic.updateValue(value, forKey: defaultName)
        }else
        {
            dic = [defaultName:value]
        }
        
        //save
        let newData = try! PropertyListSerialization.data(fromPropertyList: dic, format: .xml, options: 0)
        try! newData.write(to: fileURL)
        
    }
    
    
    
    func removeObject(forKey defaultName: String)
    {
        
        if FileManager.default.fileExists(atPath: fullPath)
        {
            //load
            let data = try! Data(contentsOf: fileURL)
            let propetyList =  try! PropertyListSerialization.propertyList(from: data, options: .mutableContainersAndLeaves, format: nil)
            var dic = propetyList as! [String:Any?]
            
            //삭제
            dic.removeValue(forKey: defaultName)
            
            //save
            let newData = try! PropertyListSerialization.data(fromPropertyList: dic, format: .xml, options: 0)
            try! newData.write(to: fileURL)
        }
        
    }
    
}
