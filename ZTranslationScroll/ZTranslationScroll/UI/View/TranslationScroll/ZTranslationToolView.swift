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

public let kTranslationToolViewHeight: CGFloat = 45

class ZTranslationToolView: UIView {
    
    // MARK: - CustomProerty
    
    var itemBlockProerty: itemClickBlock?
    
    private var scrollView: ZScrollView?
    private var imgLine: UIView?
    private var itemIndex: Int = 0
    private var viewData: [ZModelBannerType]?
    private let itemW: CGFloat = 60
    private let itemH: CGFloat = kTranslationToolViewHeight
    
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
        viewData = nil
        imgLine = nil
        scrollView = nil
    }
    
    // MARK: - PrivateMethod
    
    private func innerInit() {
        self.scrollView = ZScrollView(frame: self.bounds)
        self.scrollView?.showsVerticalScrollIndicator = false
        self.scrollView?.showsHorizontalScrollIndicator = false
        self.scrollView?.backgroundColor = UIColor.red
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
        
        self.itemIndex = lroundf(Float(offsetX / self.scrollView!.contentSize.width))
        debugPrint("itemIndex: \(self.itemIndex)")
        for view in self.scrollView!.subviews {
            switch view {
            case is UIButton:
                let btnItem = view as? UIButton
                if btnItem?.tag == self.itemIndex {
                    btnItem?.setTitleColor(.green, for: .normal)
                    if itemIndex == 0 {
                        btnItem?.setTitleColor(.green, for: .normal)
                    } else {
                        btnItem?.setTitleColor(.black, for: .normal)
                    }
                }
            default: break
            }
        }
        
        //let contentX = self.itemW * CGFloat(self.itemIndex)
        //self.scrollView?.contentOffset = CGPoint(x: contentX, y: 0)
    }
    /// 索引改变导航线的位置
    func setItemIndexChange(_ itemIndex: Int) {
        self.itemIndex = itemIndex
        self.setLingViewFrameChange()
    }
    /// 设置数据源
    func setViewData(array: [ZModelBannerType]) {
        self.viewData = array
        for view in self.scrollView!.subviews {
            view.removeFromSuperview()
        }
        let contentW = (self.itemW * CGFloat(array.count))
        self.scrollView?.contentSize = CGSize(width: contentW, height: self.itemH)
        for (itemIndex, item) in array.enumerated() {
            let itemX = CGFloat(itemIndex) * self.itemW
            let itemFrame = CGRect(x: itemX, y: 0, width: self.itemW, height: self.itemH)
            let btnItem = UIButton(frame: itemFrame)
            btnItem.tag = itemIndex
            if itemIndex == 0 {
                btnItem.setTitleColor(.green, for: .normal)
            } else {
                btnItem.setTitleColor(.black, for: .normal)
            }
            btnItem.setTitle(item.name, for: .normal)
            btnItem.titleLabel?.font = UIFont.systemFont(ofSize: 16)
            btnItem.contentHorizontalAlignment = .center
            btnItem.addTarget(self, action: #selector(btnItemClick(sender:)), for: .touchUpInside)
            
            self.scrollView?.addSubview(btnItem)
        }
        self.setItemIndexChange(0)
    }
    
    // MARK: - Event
    
    @objc func btnItemClick(sender: UIButton) {
        
    }
    
}
