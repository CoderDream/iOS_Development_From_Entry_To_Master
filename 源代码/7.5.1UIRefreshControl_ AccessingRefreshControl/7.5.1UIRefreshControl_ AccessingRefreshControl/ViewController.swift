//
//  ViewController.swift
//  7.5.1UIRefreshControl_ AccessingRefreshControl
//
//  Created by 王亮 on 16/7/11.
//  Copyright © 2016年 www.coolketang.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource{

    @IBOutlet weak var tabvLayout: UITableView!
    
    var refreshControl = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.automaticallyAdjustsScrollViewInsets = false
        
        //添加刷新
        refreshControl.addTarget(self, action: #selector(refreshData), for: UIControlEvents.valueChanged)
        refreshControl.attributedTitle = NSAttributedString(string: "松开后自动刷新")
        tabvLayout.addSubview(refreshControl)
        refreshData()
    }
    
    
    // 刷新数据
    func refreshData() {
            self.tabvLayout.reloadData()
            self.refreshControl.endRefreshing()

    }
    
    // MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCellStyle.value1, reuseIdentifier: "newsCell")
        
        let date = NSDate()
        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = "yyy-MM-dd 'at' HH:mm:ss.SSS" //(格式可俺按自己需求修整)
        let strNowTime = timeFormatter.string(from: date as Date) as String
        cell.textLabel?.text  = strNowTime
        let rect = CGRect(x:0,y:cell.frame.height-1,width :self.view.frame.size.width,height:1)
        let label = UILabel(frame: rect)
        label.backgroundColor = UIColor.lightGray
        cell .addSubview(label)
        return cell;
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

