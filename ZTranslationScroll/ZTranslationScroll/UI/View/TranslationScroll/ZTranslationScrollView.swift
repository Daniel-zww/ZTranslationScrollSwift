//
//  ZTranslationScrollView.swift
//  ZTranslationScroll
//
//  Created by Daniel on 09/06/2017.
//  Copyright © 2017 Z. All rights reserved.
//

import UIKit

/// 平移滚动View
class ZTranslationScrollView: UIView {

    // MARK: - CustomProerty
    
    var viewMain: ZScrollView?
    var viewTop: ZTranslationTopView?
    var viewTool: ZTranslationToolView?
    var viewItem: ZScrollView?
    
    // MARK: - SuperMethod
    
    private var scrollView: ZScrollView?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    convenience init() {
        self.init(frame: CGRect.zero)
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.innerInit()
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        self.innerInit()
    }
    
    // MARK: - PrivateMethod
    
    private func innerInit() {
        self.scrollView = ZScrollView()
        self.scrollView?.showsVerticalScrollIndicator = false
        self.scrollView?.showsHorizontalScrollIndicator = false
        self.scrollView?.backgroundColor = UIColor.white
        self.addSubview(self.scrollView!)
    }
    
    // MARK: - PublicMethod
    
    /// 设置数据源
    func setViewData(array: [ZModelBannerType]) {
        
    }

}
