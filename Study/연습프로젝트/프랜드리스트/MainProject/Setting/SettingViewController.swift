//
//  SettingViewController.swift
//  MainProject
//
//  Created by youngmin joo on 2018. 3. 2..
//  Copyright © 2018년 youngmin joo. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController {

    lazy var dataAdapter:SettingDataAdapter = SettingDataAdapter()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}

extension SettingViewController: UITableViewDataSource, UITableViewDelegate
{
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return dataAdapter.sectionCount()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let rowCount = dataAdapter.rowCount(of: section)
        
        return rowCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let rowData = dataAdapter[indexPath]
        switch rowData.style {
        case .Basic:
            let cell = tableView.dequeueReusableCell(withIdentifier: "basicCell", for: indexPath) as! BasicTableViewCell
            cell.textLabel?.text = rowData.title
            
            cell.indexPath = indexPath
            return cell
        case .Detail:
            let cell = tableView.dequeueReusableCell(withIdentifier: "detailCell", for: indexPath) as! DetailTableViewCell
            cell.textLabel?.text = rowData.title
            return cell
        case .Switch:
            let cell = tableView.dequeueReusableCell(withIdentifier: "switchCell", for: indexPath) as! SwitchTableViewCell
            cell.textLabel?.text = rowData.title
            return cell
        
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return dataAdapter[section]
    }
    
}








