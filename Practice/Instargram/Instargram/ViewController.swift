//
//  ViewController.swift
//  Instargram
//
//  Created by 박소정 on 2018. 2. 22..
//  Copyright © 2018년 sangwook park. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let titleArr : [String] = ["wargi_p","w_o_o_kk","sararah","ji__Silver","_victory"]
    let gpsArr : [String] = ["Spain","Korea","Canada","Meseum","Afreeca"]
    let commentArr : [String] = ["#전시회","#얼룩말","#호랑이","#여자","#팝아트"]
    let imgArr : [UIImage] = [UIImage(named: "one.jpeg")!, UIImage(named: "two.jpeg")!, UIImage(named: "three.jpeg")!, UIImage(named: "four.jpeg")!, UIImage(named: "five.jpeg")!]
    let topImgArr : [UIImage] = [UIImage(named: "JJ")!, UIImage(named: "ho")!, UIImage(named: "GithubLogo")!, UIImage(named: "Logo")!, UIImage(named: "YoutubeLogo")!]
    

    @IBOutlet var instar : UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Instagram"
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titleArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "InstaTableViewCell", for: indexPath) as! InstaTableViewCell
        cell.isSelected = false
        cell.title = titleArr[indexPath.row]
        cell.mainImg = imgArr[indexPath.row]
        cell.gpsText = gpsArr[indexPath.row]
        cell.topImg = topImgArr[indexPath.row]
        cell.commentInput = commentArr[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 532
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

