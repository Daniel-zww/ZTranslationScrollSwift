//
//  ZTranslationItemTV.swift
//  ZTranslationScroll
//
//  Created by Daniel on 09/06/2017.
//  Copyright © 2017 Z. All rights reserved.
//

import UIKit

class ZTranslationItemTV: UIView, UITableViewDelegate, UITableViewDataSource {

    // MARK: - CustomProerty
    
    var tvMain: ZTableView?
    private var arrayMain: [ZModelMusic]?
    
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
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.setViewFrame()
    }
    // MARK: - PrivateMethod
    
    private func innerInit() {
        self.tvMain = ZTableView(frame: self.bounds)
        self.tvMain?.dataSource = self
        self.tvMain?.delegate = self
        self.tvMain?.rowHeight = ZTranslationItemTVC.getH()
        self.addSubview(self.tvMain!)
        
        self.setViewFrame()
    }
    func setViewFrame() {
        self.tvMain?.frame = self.bounds
    }
    
    // MARK: - PublicMethod
    
    func setViewData(array: [ZModelMusic]) {
        self.arrayMain = array
        self.tvMain?.reloadData()
    }
    
    // MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let arrayMain = arrayMain {
            return arrayMain.count
        }
        return 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellId = "cellReuseIdentifier"
        var cell: ZTranslationItemTVC? = tableView.dequeueReusableCell(withIdentifier: cellId) as? ZTranslationItemTVC
        if cell == nil {
            cell = ZTranslationItemTVC(reuseIdentifier: cellId)
        }
        let model = self.arrayMain?[indexPath.row]
        cell?.setCellData(model: model)
        
        return cell!
    }

}
