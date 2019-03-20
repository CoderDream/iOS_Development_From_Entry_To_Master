//
//  CustomizeUITableViewCell.swift
//  CustomizeUITableViewCell
//
//  Created by CoderDream on 2019/3/20.
//  Copyright © 2019 CoderDream. All rights reserved.
//
import UIKit

class CustomizeUITableViewCell: UITableViewCell {
    
    var thumbnail : UIImageView!
    var title : UILabel!
    var detail : UIButton!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {        
        super.init(style: style, reuseIdentifier: reuseIdentifier);
        
        self.thumbnail = UIImageView(image: UIImage(named: "user"))
        self.thumbnail.center = CGPoint(x: 30, y: 22)
        self.title = UILabel(frame: CGRect(x: 80, y: 0, width: 120, height: 40))
        self.title.text = "自定义单元格"
        
        self.detail = UIButton(frame: CGRect(x: 240, y: 8, width: 60, height: 24))
        self.detail.setTitle("详情", for: UIControl.State())
        self.detail.backgroundColor = UIColor.gray
        self.detail.addTarget(self, action: #selector(CustomizeUITableViewCell.showDetail(_:)), for: UIControl.Event.touchUpInside)
        
        self.addSubview(self.thumbnail)
        self.addSubview(self.title)
        self.addSubview(self.detail)
    }
    
    @objc func showDetail(_ sender:UIButton){
        print("显示详细信息")
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(code:)has not brrn implomented");
    }
}
