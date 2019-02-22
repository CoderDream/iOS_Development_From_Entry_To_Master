//
//  NewsListTableViewCell.swift
//  SwiftNews
//
//  Created by 王亮 on 16/8/31.
//  Copyright © 2016年 www.coolketang.com. All rights reserved.
//

import UIKit
import Kingfisher

class NewsListTableViewCell: UITableViewCell {

    //图片
    @IBOutlet weak var imgvHeader: UIImageView!
    //文字标题
    @IBOutlet weak var labTitle: UILabel!
    //作者
    @IBOutlet weak var labAuthor: UILabel!
    //发布日期
    @IBOutlet weak var labPublishData: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func updateViews(modelBean:ResResultDataBaseModelBean) -> Void {
        self.labTitle.text = modelBean.title
        self.imgvHeader.kf_showIndicatorWhenLoading = true
        self.imgvHeader.kf_setImageWithURL(NSURL(string:modelBean.thumbnail_pic_s! ) , placeholderImage: UIImage(named: "tab_video"));
        self.labAuthor.text = modelBean.author_name
        self.labPublishData.text = modelBean.date
    }
    
    
}
