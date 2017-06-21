//
//  ZModelBannerType.swift
//  ZTranslationScroll
//
//  Created by Daniel on 09/06/2017.
//  Copyright © 2017 Z. All rights reserved.
//

import UIKit

class ZModelBannerType: NSObject {

    /// ID
    var id: Int64 = 0
    /// 分类名称
    var name: String = ""

    convenience init(id: Int64, name: String) {
        self.init()
        self.id = id
        self.name = name
    }
}
