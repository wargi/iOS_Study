//
//  ViewController.swift
//  TableViewTest
//
//  Created by 박소정 on 2018. 2. 21..
//  Copyright © 2018년 sangwook park. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var animalsList : [String] = ["오리","강아지","너구리","하마","호랑이","토끼","사자","코뿔소","코끼리","기린"]
    var str:String = "a"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "메모장"
        let tableView = UITableView(frame: view.bounds, style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        view.addSubview(tableView)
        // Do any additional setup after loading the view, typically from a nib.
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return animalsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        cell.textLabel?.text = animalsList[indexPath.row]
//        if str.count < 10 {
//            str += "a"
//        }
//        cell.textLabel?.text = str
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.isSelected = false
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let cell = tableView.cellForRow(at: indexPath)
        
        let title = tableView.cellForRow(at: indexPath)?.textLabel?.text
        let nextViewController = self.storyboard?.instantiateViewController(withIdentifier: "NextViewController") as! NextViewController
//        cell?.isSelected = falsex
        self.navigationController?.pushViewController(nextViewController, animated: true)
        
        nextViewController.text = title
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

