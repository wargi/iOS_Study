//
//  MainDataCenter.swift
//  Project
//
//  Created by 박소정 on 2018. 2. 28..
//  Copyright © 2018년 sangwook park. All rights reserved.
//

import Foundation

class MainDataCenter
{
    static var sharedInstance: MainDataCenter = MainDataCenter()
    
    private var friendList:[[String:String]]!
    private var settingList:[[String:Any]]!
    
    var friendListCount:Int {
        get {
            return friendList.count
        }
    }
    
    var settingListCount:Int {
        return settingList.count
    }
    
    
    var friendListModel:[UserModel]
    {
        var list:[UserModel] = []
        for dic in friendList
        {
            list.append(UserModel(withDic: dic)!)
        }
        return list
    }
    
    var settingListModel:[UserSetting]
    {
        var list:[UserSetting] = []
        for dic in settingList
        {
            list.append(UserSetting(withDic: dic)!)
        }
        return list
    }
    
    private init()
    {
        loadFriendList()
        loadSettingList()
    }
    
    private func loadFriendList()
    {
        guard let path = Bundle.main.path(forResource: "FriendInfo", ofType: "plist") else { return }
        let data = try! Data(contentsOf: URL(fileURLWithPath: path))
        let property = try! PropertyListSerialization.propertyList(from: data, options: .mutableContainersAndLeaves, format: nil)
        let list = property as! [[String:String]]
        
        friendList = list
    }
    
    private func loadSettingList()
    {
        guard let path = Bundle.main.path(forResource: "Settings", ofType: "plist") else { return }
        let data = try! Data(contentsOf: URL(fileURLWithPath: path))
        let property = try! PropertyListSerialization.propertyList(from: data, options: .mutableContainersAndLeaves, format: nil)
        let list = property as! [[String:Any]]
        
        settingList = list
    }
    
    func friendData(with index:Int) -> UserModel?
    {
        let dic = friendList[index]
        return UserModel(withDic: dic)
    }
    
    func settingData(with index:Int) -> UserSetting?
    {
        let dic = settingList[index]
        return UserSetting(withDic: dic)
    }
}

struct UserModel {

    var profileImgUrl:String
    var profileDescription:String
    var bgImgUrl:String
    var statusDescription:String
    var nickname:String
    var phonNumber:String
    var email:String
    
    init?(withDic:[String:String]) {
        guard let profileImgUrl = withDic["ProfileImage"] else { return nil }
        guard let profileDescription = withDic["MyProfileDescription"] else { return nil }
        guard let bgImgUrl = withDic["BackgroundImage"] else { return nil }
        guard let statusDescription = withDic["StatusDescription"] else { return nil }
        guard let nickname = withDic["Nickname"] else { return nil }
        guard let phonNumber = withDic["PhoneNumber"] else { return nil }
        guard let email = withDic["Email"] else { return nil }
        
        self.profileImgUrl = profileImgUrl
        self.profileDescription = profileDescription
        self.bgImgUrl = bgImgUrl
        self.statusDescription = statusDescription
        self.nickname = nickname
        self.phonNumber = phonNumber
        self.email = email
    }
}
struct dataSetting {
    var cellStyle:String
    var content:String
    
    init?(withDic:[String:String]) {
        guard let cellStyle = withDic["CellStyle"] else { return nil }
        guard let content = withDic["Content"] else { return nil }
        
        self.cellStyle = cellStyle
        self.content = content
    }
}

struct UserSetting {
    var sectionTitle: String
    var dataList: [dataSetting] = []

    init?(withDic:[String:Any]) {
        guard let sectionTitle = withDic["SectionTitle"] as? String else { return nil }
        guard let data = withDic["Data"] as? [[String:String]] else { return nil }
        
        self.sectionTitle = sectionTitle
        for dic in data {
            self.dataList.append(dataSetting(withDic: dic)!)
        }
    }
}

