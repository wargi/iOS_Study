//
//  MainViewController.swift
//  Network
//
//  Created by 박소정 on 2018. 3. 27..
//  Copyright © 2018년 sangwook park. All rights reserved.
//

import UIKit
import Alamofire

class MainViewController: UITableViewController {

    var token: String!
    var dataList: [List]?
    var imgTemp: UIImage!
    
//    @IBOutlet private weak var tableView : UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension MainViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(dataList!.count)
        return dataList!.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyTableViewCell") as! MyTableViewCell
        
        if let imgURL = dataList![indexPath.row].img_cover {
            Alamofire.request(URL(string: imgURL)!, method: .get)
                .responseJSON(completionHandler: { (imgData) in
                    switch imgData.result {
                    case .success(let img):
                        cell.imgView?.image = img as! UIImage
                    case .failure(let error):
                        print(error.localizedDescription)
                    }
                })
        }
        
        cell.date = dataList![indexPath.row].created_date
        cell.title = dataList![indexPath.row].title
        cell.content = dataList![indexPath.row].content
        
        return cell
    }
}
