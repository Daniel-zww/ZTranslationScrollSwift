//
//  ZScrollView.swift
//  ZTranslationScroll
//
//  Created by Daniel on 09/06/2017.
//  Copyright © 2017 Z. All rights reserved.
//

import UIKit

class ZScrollView: UIScrollView {

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
    deinit {
        
    }
    
    // MARK: - PrivateMethod
    
    private func innerInit() {
        self.backgroundColor = .white
    }

}
