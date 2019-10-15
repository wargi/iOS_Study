//
//  MainDataCenter.swift
//  MainProject
//
//  Created by youngmin joo on 2018. 2. 28..
//  Copyright © 2018년 youngmin joo. All rights reserved.
//

import Foundation

class MainDataCenter {
    static var sharedInstance:MainDataCenter = MainDataCenter()
    
    private var friendList:[[String:String]]!

    var friendListCount:Int{
        return friendList.count
    }
    
    var friendListModel:[UserModel]
    {
        var list:[UserModel] = []
        for dic in friendList
        {
            list.append(UserModel(with: dic)!)
        }
        return list
    }
    
    
    
    private init()
    {
        loadFriendList()
    }
    
    private func loadFriendList()
    {
        let path = Bundle.main.path(forResource: "FriendInfo", ofType: "plist")!
        let data = try! Data(contentsOf: URL(fileURLWithPath: path))
        let property = try! PropertyListSerialization.propertyList(from: data, options: .mutableContainersAndLeaves, format: nil)
        let list = property as! [[String:String]]
        
        friendList = list
    }

    func friendData(with index:Int) -> UserModel?
    {
        let dic =  friendList[index]
        return UserModel(with: dic)
    }
    
//
//    func friendListCount() -> Int
//    {
//        return friendList.count
//    }
    
}
/*
<key>PhoneNumber</key>

<key>ProfileImage</key>

<key>MyProfileDescription</key>

<key>BackgroundImage</key>

<key>StatusDescription</key>

<key>Nickname</key>

<key>Email</key>
*/
struct UserModel {
 
    var profileImgUrl:String
    var profileDescription:String
    var bgImgUrl:String
    var statusDescription:String
    var nickName:String
    var phoneNumber:String
    var email:String
    
    init?(with dic:[String:String])
    {
        guard let profileImgUrl = dic["ProfileImage"] else {return nil}
        guard let profileDescription = dic["MyProfileDescription"] else {return nil}
        guard let bgImgUrl = dic["BackgroundImage"] else {return nil}
        guard let statusDescription = dic["StatusDescription"] else {return nil}
        guard let nickName = dic["Nickname"] else {return nil}
        guard let phoneNumber = dic["PhoneNumber"] else {return nil}
        guard let email = dic["Email"] else {return nil}
        
        self.profileImgUrl = profileImgUrl
        self.profileDescription = profileDescription
        self.bgImgUrl = bgImgUrl
        self.statusDescription = statusDescription
        self.nickName = nickName
        self.phoneNumber = phoneNumber
        self.email = email
        
    }
}















