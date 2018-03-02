//
//  albumInfo.swift
//  Music
//
//  Created by 박상욱 on 2018. 2. 26..
//  Copyright © 2018년 sangwook park. All rights reserved.
//

import Foundation

struct AlbumInfo {
    //AlbumInfo
    var albumTitle: String
    var albumArtist: String
    var genre: String
    
    init?(dic: [String:String]) {
        guard let title = dic["albumTitle"] else { return nil }
        guard let artist = dic["artist"] else { return nil }
        guard let genre = dic["genre"] else { return nil }
        
        self.albumTitle = title
        self.albumArtist = artist
        self.genre = genre
    }
}
