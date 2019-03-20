//
//  ViewController.swift
//  CustomizeUITableViewHeight
//
//  Created by CoderDream on 2019/3/20.
//  Copyright © 2019 CoderDream. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let screenRect = UIScreen.main.bounds
        let tableRect = CGRect(x: 0, y: 20, width: screenRect.size.width, height: screenRect.size.height - 20)
        let tableView = UITableView(frame: tableRect)
        
        tableView.dataSource = self
        tableView.delegate = self
        
        self.view.addSubview(tableView)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if (indexPath as NSIndexPath).row % 2 == 0 {
            return 104;
        }
        return 40;
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 40
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = "reusedCell"
        var cell = tableView.dequeueReusableCell(withIdentifier: identifier)
        
        if cell == nil {
            print("indexPath New:  \(indexPath)")
            cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: identifier)
        }
        
        if (indexPath as NSIndexPath).row % 2 == 0 {
            print("indexPath A:  \(indexPath)")
            cell?.imageView?.image = UIImage(named: "picture.png")
        }
        else {
            print("indexPath B:  \(indexPath)")
            cell?.textLabel?.text = "\(indexPath)每有会意，便欣然忘食！"
        }
        
        return cell!
    }
    
}

