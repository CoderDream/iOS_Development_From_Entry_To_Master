//
//  ViewController.swift
//  CustomizeUITableViewCell
//
//  Created by CoderDream on 2019/3/20.
//  Copyright © 2019 CoderDream. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let screenRect = UIScreen.main.bounds
        let tableRect = CGRect(x: 0, y: 20, width: screenRect.size.width, height: screenRect.size.height - 20)
        let tableView = UITableView(frame: tableRect)
        tableView.dataSource = self
        self.view.addSubview(tableView)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = "reusedCell"
        var cell: CustomizeUITableViewCell? = tableView.dequeueReusableCell(withIdentifier: identifier) as? CustomizeUITableViewCell
        
        if cell == nil {
            cell = CustomizeUITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: identifier)
        }
        
        cell?.title?.text = "客户姓名"
        return cell!
    }
}

