//
//  ViewController.swift
//  ZTranslationScroll
//
//  Created by Daniel on 09/06/2017.
//  Copyright © 2017 Z. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private var viewMain: ZTranslationScrollView?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.innerInit()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func innerInit() {
        let mainFrame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height-1)
        self.viewMain = ZTranslationScrollView(frame: mainFrame)
        self.view.addSubview(self.viewMain!)
        
        var arrayType = [ZModelBannerType]()
        
        let type1 = ZModelBannerType(id: 1, name: "最新")
        let type2 = ZModelBannerType(id: 2, name: "微课")
        let type3 = ZModelBannerType(id: 3, name: "热议")
        let type4 = ZModelBannerType(id: 4, name: "名家")
        let type5 = ZModelBannerType(id: 5, name: "医话")
        let type6 = ZModelBannerType(id: 6, name: "执业")
        let type7 = ZModelBannerType(id: 7, name: "医案")
        let type8 = ZModelBannerType(id: 8, name: "经方")
        let type9 = ZModelBannerType(id: 9, name: "患教")
        let type10 = ZModelBannerType(id: 10, name: "中药")
        
        arrayType.append(type1)
        arrayType.append(type2)
        arrayType.append(type3)
        arrayType.append(type4)
        arrayType.append(type5)
        arrayType.append(type6)
        arrayType.append(type7)
        arrayType.append(type8)
        arrayType.append(type9)
        arrayType.append(type10)
        
        self.viewMain?.setViewData(array: arrayType)
    }

}

