//
//  ViewController.swift
//  MainProject
//
//  Created by youngmin joo on 2018. 2. 20..
//  Copyright © 2018년 youngmin joo. All rights reserved.
//

import UIKit

let cellHeight:CGFloat = 65

class ViewController: UIViewController {

    @IBOutlet weak var tableView:UITableView!
    
    lazy var friendList:[UserModel] = MainDataCenter.sharedInstance.friendListModel
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        print("shouldPerformSegue")
        return true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("prepare")
        
        if let cell = sender as? MainCell,
            let nextVC =  segue.destination as? DetailViewController
        {
            nextVC.userData = cell.cellData
        }
    }

}



extension ViewController:UITableViewDataSource, UITableViewDelegate
{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //        return MainDataCenter.sharedInstance.friendListCount
        return friendList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MainCell
        
        //         cell.cellData = MainDataCenter.sharedInstance.friendData(with: indexPath.row)
        cell.cellData = friendList[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellHeight
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //        let cell = tableView.cellForRow(at: indexPath) as! MainCell
        //        cell.cellData
        tableView.deselectRow(at: indexPath, animated: true)
    }
}





