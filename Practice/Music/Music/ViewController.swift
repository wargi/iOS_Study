//
//  ViewController.swift
//  Music
//
//  Created by 박상욱 on 2018. 2. 26..
//  Copyright © 2018년 sangwook park. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var albumArtist: UILabel!
    @IBOutlet weak var albumTitle: UILabel!
    @IBOutlet weak var genre: UILabel!

    let musicPlayer = Album(dic: album)!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        albumTitle.text = musicPlayer.albumInfo.albumTitle
        albumArtist.text = musicPlayer.albumInfo.albumArtist
        genre.text = musicPlayer.albumInfo.genre
//        loadPath(fileName: "Album")
        
        MyUserDefaults.standard.set("Hi", forKey: "Str")
        let dic = MyUserDefaults.standard.object(forkey: "Str") as? [String:String]
        
        print(dic)

    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return musicPlayer.songList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = musicPlayer.songList[indexPath.row].songTitlte
        
        return cell
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadPath(fileName:String) -> [String:String]? {
        let rootPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)[0]
        let fullPath = rootPath + "/" + fileName + ".plist"
        
        do {
            //파일이 존재하지 않을 때 !
            if !FileManager.default.fileExists(atPath: fullPath),
                //번들경로를 얻어서
                let bundlePath = Bundle.main.path(forResource: fileName, ofType: "plist")
            {
                //번들에 있는 데이터를 도큐먼트에 복사 -> copy
                try? FileManager.default.copyItem(atPath: bundlePath, toPath: fullPath)
            }
            
            if let data = try? Data(contentsOf: URL(fileURLWithPath: fullPath)),
                var dic = try? PropertyListSerialization.propertyList(from: data, options: .mutableContainersAndLeaves, format: nil) as! [String:String]
            {
                dic.updateValue("wing", forKey: "ID")
                
                let newData = try? PropertyListSerialization.data(fromPropertyList: dic, format: .xml, options: 0)
                try? newData?.write(to: URL(fileURLWithPath: fullPath))
            }
        } catch
        {
            return nil
        }

        
        return nil
    }


}

