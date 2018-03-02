//
//  Album.swift
//  Music
//
//  Created by 박상욱 on 2018. 2. 26..
//  Copyright © 2018년 sangwook park. All rights reserved.
//

import Foundation

struct Album {
    
    var albumInfo: AlbumInfo
    var songList: [SongList] = []
    
    init?(dic: [String:Any]) {
        guard let album = dic["albumInfo"] as? [String: String] else { return nil }
        
        self.albumInfo = AlbumInfo(dic: album)!
        
        if let songList = dic["songList"] as? [[String: Any]] {
            for info in songList {
                if let model = SongList(dic : info) {
                    self.songList.append(model)
                }
            }
        }
        
    }
}
