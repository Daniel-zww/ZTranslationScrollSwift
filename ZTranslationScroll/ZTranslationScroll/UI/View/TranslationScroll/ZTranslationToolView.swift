//
//  ZTranslationToolView.swift
//  ZTranslationScroll
//
//  Created by Daniel on 09/06/2017.
//  Copyright © 2017 Z. All rights reserved.
//

import UIKit
import SnapKit

/// 子项点击回调
typealias itemClickBlock = (_ itemIndex: Int) ->()

class ZTranslationToolView: UIView {
    
    // MARK: - CustomProerty
    
    var itemBlockProerty: itemClickBlock?
    
    private var scrollView: ZScrollView?
    private var imgLine: UIView?
    private var itemIndex: Int = 0
    private var viewData: [ZModelBannerType]?
    private let itemW: CGFloat = 60
    private let itemH: CGFloat = 45
    private var lastItem: UIButton?
    
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
        self.setLingViewFrameChange()
    }
    deinit {
        lastItem = nil
        viewData = nil
        imgLine = nil
        scrollView = nil
    }
    
    // MARK: - PrivateMethod
    
    private func innerInit() {
        self.scrollView = ZScrollView()
        self.scrollView?.showsVerticalScrollIndicator = false
        self.scrollView?.showsHorizontalScrollIndicator = false
        self.scrollView?.backgroundColor = UIColor.white
        self.addSubview(self.scrollView!)
        
        self.imgLine = UIView.navLineView()
        self.imgLine?.isUserInteractionEnabled = false
        self.addSubview(self.imgLine!)
        
        self.innerFrame()
        self.setItemIndexChange(0)
    }
    private func innerFrame() {
        self.scrollView?.snp.removeConstraints()
        self.scrollView?.snp.makeConstraints({[weak self] (make) in
            if self != nil {
                if self != nil {
                    make.edges.equalTo(self!).inset(UIEdgeInsets.zero)
                }
            }
        })
    }
    /// 设置导航线坐标
    private func setLingViewFrameChange() {
        let lineX = self.itemW * CGFloat(self.itemIndex)
        let lineY = self.scrollView!.frame.size.height - 5
        let lineW = self.itemW, lineH: CGFloat = 5
        self.imgLine?.frame = CGRect(x: lineX, y: lineY, width: lineW, height: lineH)
    }
    
    // MARK: - PublicMethod
    
    /// 滑动改变导航线的位置
    func setItemIndexChange(offsetX: CGFloat) {
        let scale: CGFloat = offsetX / UIScreen.main.bounds.width
        let lineX = self.itemW * scale
        let lineY = self.scrollView!.frame.size.height - 5
        let lineW = self.itemW, lineH: CGFloat = 5
        self.imgLine?.frame = CGRect(x: lineX, y: lineY, width: lineW, height: lineH)
    }
    /// 索引改变导航线的位置
    func setItemIndexChange(_ itemIndex: Int) {
        self.itemIndex = itemIndex
        self.setLingViewFrameChange()
    }
    /// 设置数据源
    func setViewData(array: [ZModelBannerType]) {
        self.viewData = array
        let contentW = (self.itemW * CGFloat(array.count))
        self.scrollView?.contentSize = CGSize(width: contentW, height: self.itemH)
        for (itemIndex, item) in array.enumerated() {
            let btnItem = UIButton(type: .custom)
            btnItem.tag = itemIndex
            if itemIndex == 0 {
                btnItem.setTitleColor(self.imgLine?.backgroundColor, for: .normal)
            } else {
                btnItem.setTitle(item.name, for: .normal)
            }
            btnItem.setTitleColor(.black, for: .normal)
            btnItem.titleLabel?.font = UIFont.systemFont(ofSize: 16)
            btnItem.contentHorizontalAlignment = .center
            btnItem.addTarget(self, action: #selector(btnItemClick(sender:)), for: .touchUpInside)
            btnItem.snp.makeConstraints({[weak self] (make) in
                if self != nil {
                    make.width.equalTo(self!.itemW)
                    make.height.equalTo(self!.itemH)
                    make.top.equalTo(self!.scrollView!.snp.top).offset(0)
                    if self!.lastItem != nil {
                        make.left.equalTo(self!.lastItem!.snp.right).offset(0)
                    } else {
                        make.left.equalTo(self!.scrollView!.snp.left).offset(0)
                    }
                }
            })
            self.lastItem = btnItem
            self.scrollView?.addSubview(btnItem)
        }
        self.setItemIndexChange(0)
    }
    
    // MARK: - Event
    
    @objc func btnItemClick(sender: UIButton) {
        
    }
    
}
