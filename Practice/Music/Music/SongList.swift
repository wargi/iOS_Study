//
//  songList.swift
//  Music
//
//  Created by 박상욱 on 2018. 2. 26..
//  Copyright © 2018년 sangwook park. All rights reserved.
//

import Foundation

struct SongList {
    //SongList
    var songTitlte: String
    var trackNum: Int
    var artist: String
    var writer: String
    var playTime: Int
    var playURL: String
    
    init?(dic: [String:Any]) {
        guard let title = dic["songTitle"] as? String else { return nil }
        guard let track = dic["trackNum"] as? Int else { return nil }
        guard let artist = dic["artist"] as? String else { return nil }
        guard let writer = dic["writer"] as? String else { return nil }
        guard let time = dic["playTime"] as? Int else { return nil }
        guard let url = dic["playURL"] as? String else { return nil }
            
        self.songTitlte = title
        self.trackNum = track
        self.artist = artist
        self.writer = writer
        self.playTime = time
        self.playURL = url
    }
}
