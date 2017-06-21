//
//  ZBaseTVC.swift
//  ZMusicPlayerSwiftDemo
//
//  Created by Daniel on 23/05/2017.
//  Copyright © 2017 Z. All rights reserved.
//

import UIKit
import SnapKit

class ZBaseTVC: UITableViewCell {

    // MARK: - CustomProerty
    
    let space: CGFloat = 10
    let lbH: CGFloat = 22
    
    var cellW: CGFloat = 0
    var cellH: CGFloat = 0
    
    // MARK: - SuperMethod
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.innerInit()
    }
    public convenience init(reuseIdentifier: String?) {
        self.init(style: .`default`, reuseIdentifier: reuseIdentifier)
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        self.innerInit()
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.cellW = self.contentView.frame.size.width
        self.cellH = self.contentView.frame.size.height
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // MARK: - PublicMethod
    
    open func innerInit() {
        self.selectionStyle = .none
        self.accessoryType = .none
        self.backgroundColor = .clear
        self.isUserInteractionEnabled = true
        self.contentView.backgroundColor = UIColor.white
        self.contentView.isUserInteractionEnabled = true
    }

}
