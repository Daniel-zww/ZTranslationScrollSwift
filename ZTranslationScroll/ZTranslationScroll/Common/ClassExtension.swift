//
//  ClassExtension.swift
//  ZTranslationScroll
//
//  Created by Daniel on 09/06/2017.
//  Copyright © 2017 Z. All rights reserved.
//

import UIKit

extension UIView {
    
    /// 导航线
    class func navLineView() -> UIView {
        let view = UIView()
        view.backgroundColor = UIColor.green
        return view
    }
    /// 分割线
    class func spaceLineView() -> UIView {
        let view = UIView()
        view.backgroundColor = UIColor.gray
        return view
    }
}
