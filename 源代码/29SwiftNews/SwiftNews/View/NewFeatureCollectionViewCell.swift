//
//  NewFeatureCollectionViewCell.swift
//  SwiftNews
//
//  Created by 王亮 on 16/9/4.
//  Copyright © 2016年 www.coolketang.com. All rights reserved.
//

import UIKit
import SnapKit


class NewFeatureCollectionViewCell: UICollectionViewCell {
    // 显示的image
    var image : UIImage?
        {
        didSet{
            if let img = image {
                imageView.image = img
            }
        }
    }
    
    // 显示的lable
    var title : String?
        {
        didSet{
            if let text  = title {
                labTitle.text = text
            }
        }
    }
    
    // MARK: - 内部控制方法
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup()
    {
        contentView.addSubview(imageView)
        contentView.addSubview(labTitle)
        labTitle.textAlignment = NSTextAlignment.Center
        labTitle.font = UIFont.systemFontOfSize(30)
        labTitle.textColor = UIColor.yellowColor()
        imageView.snp_makeConstraints { (make) in
            make.edges.equalTo(0)
        }
        
        labTitle.snp_makeConstraints { (make) in
            make.top.equalTo(60)
            make.leading.equalTo(0)
            make.trailing.equalTo(0)
            make.height.equalTo(30)
        }
    }
    
    // MARK: - 懒加载
    private lazy var imageView : UIImageView = UIImageView()
    private lazy var labTitle : UILabel = UILabel()
}
