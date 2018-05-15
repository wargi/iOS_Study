//
//  SettingDataApater.swift
//  MainProject
//
//  Created by youngmin joo on 2018. 3. 2..
//  Copyright © 2018년 youngmin joo. All rights reserved.
//

import Foundation

enum CellStyle:String
{
    case Basic = "SettingBasicCell"
    case Detail = "SettingDetailCell"
    case Switch = "SettingSwitchCell"
}

class SettingDataAdapter {
    
    var settingDataList:[SettingData]!
    
        
    init() {
        //데이터 읽어오기
        settingDataList = loadSettingData()
        
    }
    
    
    //갯수
    func sectionCount() -> Int
    {
        return settingDataList.count
    }
    
    func rowCount(of section:Int) -> Int
    {
        let sectionData = settingDataList[section]
        return sectionData.rows.count
    }
    
    subscript(indexPath:IndexPath) -> RowData
    {
        let section = indexPath.section
        let row = indexPath.row
        let sectionData = settingDataList[section]
        let rowData = sectionData.rows[row]
        return rowData
    }
    
    subscript(section:Int) -> String
    {
        let sectionData = settingDataList[section]
        return sectionData.sectionTitle
    }
    
    
    
    
    //MARK : - Private Method
    private func loadSettingData() -> [SettingData]
    {
        var returnList:[SettingData] = []
        
        let path = Bundle.main.path(forResource: "Settings", ofType: "plist")!
        let data = try! Data(contentsOf: path.pathURL())
        let list = try! PropertyListSerialization.propertyList(from: data, options: .mutableContainersAndLeaves, format: nil) as! [[String:Any]]
        
        for dataDic in list
        {
            if let settingData = SettingData(data: dataDic)
            {
                returnList.append(settingData)
            }
        }
        
        return returnList
    }
    
    
    
}

extension String
{
    func pathURL() -> URL
    {
        return URL(fileURLWithPath: self)
    }
    
}







struct SettingData  {
    var sectionTitle:String
    var rows:[RowData] = []
    
    init?(data:[String:Any])
    {
        guard let title = data["SectionTitle"] as? String else {return nil}
        self.sectionTitle = title

        guard let rowDatas = data["Data"] as? [[String:Any]] else {return nil}
        
        for dic in rowDatas
        {
            if let rowData = RowData(data: dic)
            {
                self.rows.append(rowData)
            }
            
        }
        
    }
}

struct RowData {
    var title:String
    var style:CellStyle
    
    init?(data:[String:Any])
    {
        
        guard let title = data["Content"] as? String else {return nil}
        self.title = title

        guard let styleStr = data["CellStyle"] as? String else {return nil}
        guard let style = CellStyle(rawValue: styleStr) else {return nil}
        self.style = style
    }
}








