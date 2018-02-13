//
//  ViewControllerNext.swift
//  NavigationSample
//
//  Created by 박소정 on 2018. 2. 9..
//  Copyright © 2018년 sangwook park. All rights reserved.
//

import UIKit

class ViewControllerNext: UIViewController {

    var login: UILabel!
    var backIma: UIImageView!
    var id: UILabel!
    var pw: UILabel!
    var idTF: UITextField!
    var pwTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        update()

    }

    func update()
    {
        login = UILabel(frame: CGRect(x: (view.frame.maxX/2)-100, y: 180, width: 200, height: 40))
        backIma = UIImageView(image: UIImage(named: "JJ.jpg"))
        id = UILabel(frame: CGRect(x: 100, y: 610, width: 30, height: 21))
        pw = UILabel(frame: CGRect(x: 100, y: 650, width: 30, height: 21))
        idTF = UITextField(frame: CGRect(x: 140, y: 610, width: 160, height: 30))
        pwTF = UITextField(frame: CGRect(x: 140, y: 650, width: 160, height: 30))
        
        backIma.frame = self.view.bounds
        view.addSubview(backIma)
        
        login.textAlignment = .center
        login.text = "Signup Page"
        login.font = UIFont.boldSystemFont(ofSize: 30)
        
        id.textAlignment = .center
        id.text = "ID"
        pw.textAlignment = .center
        pw.text = "PW"
        
        idTF.layer.borderWidth = 1
        pwTF.layer.borderWidth = 1
        
        self.view.addSubview(id)
        self.view.addSubview(pw)
        self.view.addSubview(login)
        self.view.addSubview(idTF)
        self.view.addSubview(pwTF)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
