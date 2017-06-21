//
//  ZTranslationScrollView.swift
//  ZTranslationScroll
//
//  Created by Daniel on 09/06/2017.
//  Copyright © 2017 Z. All rights reserved.
//

import UIKit

/// 平移滚动View
class ZTranslationScrollView: UIView, UIScrollViewDelegate {

    // MARK: - CustomProerty
    
    private var viewMain: ZScrollView?
    private var viewTop: ZTranslationTopView?
    private var viewTool: ZTranslationToolView?
    private var viewItem: ZScrollView?
    private var lastItem: ZTranslationItemTV?
    private let topH: CGFloat = 120
    
    // MARK: - SuperMethod
    
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
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.innerViewFrame()
    }
    // MARK: - PrivateMethod
    
    private func innerInit() {
        self.viewMain = ZScrollView()
        self.viewMain?.delegate = self
        self.viewMain?.bounces = false
        self.viewMain?.showsVerticalScrollIndicator = false
        self.viewMain?.showsHorizontalScrollIndicator = false
        self.viewMain?.backgroundColor = UIColor.white
        self.addSubview(self.viewMain!)
        
        self.viewTop = ZTranslationTopView()
        self.viewMain?.addSubview(self.viewTop!)
        
        self.viewTool = ZTranslationToolView()
        self.viewMain?.addSubview(self.viewTool!)
        
        self.viewItem = ZScrollView()
        self.viewItem?.delegate = self
        self.viewItem?.showsVerticalScrollIndicator = false
        self.viewItem?.showsHorizontalScrollIndicator = false
        self.viewItem?.backgroundColor = UIColor.white
        self.viewItem?.isPagingEnabled = true
        self.viewMain?.addSubview(self.viewItem!)
        
        self.innerViewFrame()
    }
    
    private func innerViewFrame() {
        self.viewMain?.frame = self.bounds
        
        let contentW = self.frame.size.width
        let topFrame = CGRect(x: 0, y: 0, width: contentW, height: kTranslationTopViewHeight)
        self.viewTop?.frame = topFrame
        
        let toolFrame = CGRect(x: 0, y: topFrame.origin.y + topFrame.size.height, width: contentW, height: kTranslationToolViewHeight)
        self.viewTool?.frame = toolFrame
        
        let itemFrame = CGRect(x: 0, y: toolFrame.origin.y + toolFrame.size.height, width: contentW, height: UIScreen.main.bounds.height - kNavigationStatusHeight - kTranslationToolViewHeight)
        self.viewItem?.frame = itemFrame
        
        let contentH = self.viewItem!.frame.origin.y + self.viewItem!.frame.size.height
        self.viewMain?.contentSize = CGSize(width: self.frame.size.width, height: contentH)
        
        var index = 0
        for view in self.viewItem!.subviews {
            let itemX = CGFloat(index - 1) * contentW
            let itemFrame = CGRect(x: itemX, y: 0, width: contentW, height: self.viewItem!.frame.size.height)
            view.frame = itemFrame
            index += 1
        }
    }
    
    // MARK: - PublicMethod
    
    /// 设置数据源
    func setViewData(array: [ZModelBannerType]) {
        
        self.viewTool?.setViewData(array: array)
        
        for view in self.viewItem!.subviews {
            view.removeFromSuperview()
        }
        let itemW = self.frame.size.width
        for index in 1...array.count {
            let itemX = CGFloat(index - 1) * itemW
            let itemFrame = CGRect(x: itemX, y: 0, width: itemW, height: self.viewItem!.frame.size.height)
            let tvItem = ZTranslationItemTV(frame: itemFrame)
            tvItem.tvMain?.isScrollEnabled = false
            
            self.viewItem?.addSubview(tvItem)
            
            let itemModel = ZModelMusic(musicName: "这是一首歌的名称", musicIcon: "bb.jpg", singer: "歌唱者")
            tvItem.setViewData(array: [itemModel, itemModel, itemModel, itemModel, itemModel,
                                       itemModel, itemModel, itemModel, itemModel, itemModel])
            
            self.lastItem = tvItem
            self.viewItem?.addSubview(tvItem)
        }
        let contentW = CGFloat(array.count) * self.frame.size.width
        let contentH = self.viewItem!.frame.size.height
        self.viewItem?.contentSize = CGSize(width: contentW, height: contentH)
    }
    
    
    // MARK: - UIScrollViewDelegate
    /// 滚动过程中
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        debugPrint("scrollViewDidScroll: \(scrollView.contentOffset.y)")
        if scrollView.isEqual(self.viewItem) {
            self.viewTool?.setItemIndexChange(offsetX: scrollView.contentOffset.x)
        }
        if scrollView.isEqual(self.viewMain) && scrollView.contentOffset.y >= kTranslationTopViewHeight {
                debugPrint("scrollViewDidScroll: kTranslationTopViewHeight)")
            self.viewMain?.isScrollEnabled = false
            for view in self.viewItem!.subviews {
                switch view {
                case is ZTranslationItemTV:
                    let tvItem = view as? ZTranslationItemTV
                    tvItem?.tvMain?.isScrollEnabled = true
                default: break
                }
            }
        }
        if !scrollView.isEqual(self.viewItem) && !scrollView.isEqual(self.viewMain) {
            debugPrint("scrollViewDidScroll: ZTranslationItemTV)")
            self.viewMain?.isScrollEnabled = true
            for view in self.viewItem!.subviews {
                switch view {
                case is ZTranslationItemTV:
                    let tvItem = view as? ZTranslationItemTV
                    tvItem?.tvMain?.isScrollEnabled = false
                default: break
                }
            }
        }
    }
    /// 将开始降速时
    func scrollViewWillBeginDecelerating(_ scrollView: UIScrollView) {
        debugPrint("scrollViewWillBeginDecelerating")
    }
    /// 减速停止了时执行，手触摸时执行
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        debugPrint("scrollViewDidEndDecelerating")
    }
    /// 滚动动画停止时执行,代码改变时触发,也就是setContentOffset改变时
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        debugPrint("scrollViewDidEndScrollingAnimation")
    }

}
