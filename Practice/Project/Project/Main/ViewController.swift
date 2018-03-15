//
//  ViewController.swift
//  Project
//
//  Created by 박상욱 on 2018. 2. 28..
//  Copyright © 2018년 sangwook park. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    @IBOutlet var tableView: UITableView!
    
    lazy var friendList:[UserModel] = MainDataCenter.sharedInstance.friendListModel
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        print(Bundle.main.bundlePath)
        print(NSHomeDirectory())
        //self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Setting", style: .plain, target: self, action: #selector(self.ClickedSetting(_:)))
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return MainDataCenter.sharedInstance.friendListCount
        return friendList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MainCell
        
//        cell.cellData = MainDataCenter.sharedInstance.friendData(with: indexPath.row)
        cell.cellData = friendList[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        return true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let cell = sender as? MainCell,
            let nextVC = segue.destination as? DetailViewController
        {
            nextVC.userData = cell.cellData
        }
    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return cellHeight
//    }
    
//    @objc func ClickedSetting(_ Sender : UIButton) {
//        let nextVC = storyboard?.instantiateViewController(withIdentifier: "SettingVC")
//        self.navigationController?.pushViewController(nextVC!, animated: true)
//    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

