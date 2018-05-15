//
//  ViewController.swift
//  NoteSample
//
//  Created by 박소정 on 2018. 2. 26..
//  Copyright © 2018년 sangwook park. All rights reserved.
//

import UIKit



class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var userList = UserDefaults.standard.array(forKey: "User_Key") as? [String] ?? []
    var tableView:UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Note"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.edit, target: self, action: #selector(self.clickedAddMemo(_:)))
        
        NotificationCenter.default.addObserver(forName: NSNotification.Name("Noti"), object: nil, queue: nil) { (Noti) in
            
            guard let text = Noti.object as? String else { return }
            self.userList.append(text)
            
            self.tableView.reloadData()
        }
        
        tableView = UITableView(frame: view.bounds , style: UITableViewStyle.plain)
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        view.addSubview(tableView)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return userList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = userList[indexPath.row]
        return cell
    }
    
    @objc func clickedAddMemo(_ sender : UIButton) {
        let nextVC = storyboard?.instantiateViewController(withIdentifier: "NextViewController")
        navigationController?.pushViewController(nextVC!, animated: true)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name(rawValue: "Noti"), object: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

