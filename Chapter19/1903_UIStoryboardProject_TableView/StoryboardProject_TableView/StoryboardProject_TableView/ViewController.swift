//
//  ViewController.swift
//  StoryboardProject_TableView
//
//  Created by CoderDream on 2019/2/28.
//  Copyright © 2019 CoderDream. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {

    
    var fruits = ["Apple", "Banana", "Chinese Date", "Downy Picch", "Filbert", "Gingko", "Hawthorn", "Kumquat"]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fruits.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = "reusedCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        let label = cell.viewWithTag(1) as! UILabel
        label.text = fruits[(indexPath as NSIndexPath).row]
        
        return cell
    }

}

