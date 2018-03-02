//
//  ViewController.swift
//  TableViewStoryBoard
//
//  Created by 박상욱 on 2018. 2. 22..
//  Copyright © 2018년 sangwook park. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet var mainTableView:UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    //MARK : = UITableViewDataSource
    //테이블뷰의 row의 갯수를 테이블 뷰에게 알려주는 데이터 소스
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        
        //Cell의 데이터 할당
        
        
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        <#code#>
    }

}

