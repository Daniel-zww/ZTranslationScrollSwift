//
//  ZTranslationItemTV.swift
//  ZTranslationScroll
//
//  Created by Daniel on 09/06/2017.
//  Copyright © 2017 Z. All rights reserved.
//

import UIKit

class ZTranslationItemTV: ZTableView {

    // MARK: - SuperMethod
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    convenience init() {
        self.init(frame: CGRect.zero, style: UITableViewStyle.plain)
    }
    convenience init(frame: CGRect) {
        self.init(frame: frame, style: UITableViewStyle.plain)
    }
    override init(frame: CGRect, style: UITableViewStyle) {
        super.init(frame: frame, style: style)
        self.innerInit()
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        self.innerInit()
    }
    deinit {
        
    }
    
    // MARK: - PrivateMethod
    
    private func innerInit() {
        self.backgroundColor = .white
        self.separatorStyle = .none
    }

}
