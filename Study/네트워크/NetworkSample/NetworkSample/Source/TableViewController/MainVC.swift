//
//  MainVC.swift
//  NetworkSample
//
//  Created by 박소정 on 2018. 3. 27..
//  Copyright © 2018년 sangwook park. All rights reserved.
//

import UIKit
import Alamofire

class MainVC: UIViewController {
    
    var token: String?
    var dataArray: [List] = []
    @IBOutlet var tableView : UITableView!
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = false
//        var dataList:[List] = []
        let requestClass = RequestClass()
        requestClass.getData(fastURL: FastURL.postList, completion: { response in
            switch response.result {
            case .success(let data):
                self.dataArray = try! JSONDecoder().decode([List].self, from: data)
                self.tableView.reloadData()
            case .failure(let error):
                print(error)
            }
        })
        
        
//        DispatchQueue.global(qos: .background).async {
//            Alamofire.request(self.URL.postList, method: .get)
//                .responseData { (response) in
//                    dataList = try! JSONDecoder().decode([List].self, from: response.data!)
//                    print(dataList.count)
//                    self.dataArray = dataList
//                    self.tableView.reloadData()
//            }
//
//
//        }
        
    }
}

extension MainVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        print(dataArray.count)
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("HI Cell")
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell") as! MyCell
        print("HI Cell")
        print(dataArray[indexPath.row].title)
        cell.title.text = dataArray[indexPath.row].title
        cell.content.text = dataArray[indexPath.row].content
        cell.date.text = dataArray[indexPath.row].created_date
        
        return cell
    }
    
    
}
