//
//  CustomizeUITableViewCell.swift
//  UITableViewInUITableView
//
//  Created by CoderDream on 2019/3/20.
//  Copyright © 2019 CoderDream. All rights reserved.
//

import UIKit

class CustomizeUITableViewCell: UITableViewCell, UITableViewDataSource, UITableViewDelegate {
    
    var tableView : UITableView!;
    var comments : [String] = []
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {        
        super.init(style: style, reuseIdentifier: reuseIdentifier);
        
        tableView = UITableView(frame: CGRect(x: 20, y: 0, width: 280, height: 90))
        tableView.dataSource = self
        tableView.delegate = self
        tableView.isScrollEnabled = false;
        
        self.addSubview(tableView)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return comments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)
        -> UITableViewCell {
            let identifier = "reusedCell"
            var cell = tableView.dequeueReusableCell(withIdentifier: identifier)
            
            if(cell == nil){
                cell = UITableViewCell(style: UITableViewCell.CellStyle.default,
                                       reuseIdentifier: identifier)
            }
            cell?.textLabel?.text = comments[(indexPath as NSIndexPath).row]
            cell?.textLabel?.font = UIFont.systemFont(ofSize: 12)
            cell?.textLabel?.textColor = UIColor.gray
            cell?.textLabel?.numberOfLines = 0;
            return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath)
        -> CGFloat {
            let subComments = comments[(indexPath as NSIndexPath).row]
            let size = subComments.boundingRect(with: CGSize(),
                                                options: NSStringDrawingOptions.usesFontLeading, attributes: nil, context: nil);
            let cellHeight =  size.height*size.width / 170
            if(cellHeight < 30){
                return 30
            }
            else {
                return cellHeight
            }
    }
    
    func setCommentsForTable(_ comments:[String]){
        self.comments = comments
        
        var tableHeight:CGFloat = 0
        for i in 0 ..< comments.count {
            let size = comments[i].boundingRect(with: CGSize(),
                                                options: NSStringDrawingOptions.usesFontLeading, attributes: nil, context: nil);
            tableHeight += size.height*size.width/170
        }
        let screenRect = UIScreen.main.bounds // 280
        tableView.frame = CGRect(x: 20, y: 0, width: screenRect.width - 20, height: tableHeight + 50)
        tableView.reloadData()
    }
    
    func getMyHeight()->CGFloat{
        return tableView.frame.size.height
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(code:)has not brrn implomented");
    }
}
