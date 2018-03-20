//
//  ViewControllerNext.swift
//  TableViewTest
//
//  Created by 박소정 on 2018. 2. 21..
//  Copyright © 2018년 sangwook park. All rights reserved.
//

import UIKit

class ViewControllerNext: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var animalsList : [String] = ["오리","강아지","너구리","하마","호랑이","토끼","사자","코뿔소","코끼리","기린"]
    @IBOutlet var tableView:UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(tableView)

        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return animalsList.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MyCustomCell.identifier, for: indexPath)
        cell.textLabel?.text = animalsList[indexPath.row]
        return cell
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}


