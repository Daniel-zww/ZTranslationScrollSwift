//
//  ZModelMusic.swift
//  ZTranslationScroll
//
//  Created by Daniel on 09/06/2017.
//  Copyright © 2017 Z. All rights reserved.
//

import UIKit

class ZModelMusic: NSObject {

    /// 歌曲名称
    var musicName: String = ""
    /// 歌曲图片
    var musicIcon: String = ""
    /// 歌手名称
    var singer: String = ""
 
    convenience init(musicName: String, musicIcon: String, singer: String) {
        self.init()
        self.musicName = musicName
        self.musicIcon = musicIcon
        self.singer = singer
    }
}
