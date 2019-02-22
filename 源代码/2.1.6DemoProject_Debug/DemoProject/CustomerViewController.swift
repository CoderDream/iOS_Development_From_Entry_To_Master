//
//  CustomerViewController.swift
//  DemoProject
//
//  Created by Jerry on 16/6/15.
//  Copyright © 2016年 coolketang.com. All rights reserved.
//

import UIKit

class CustomerViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        addImageView()
    }

    func addImageView()
    {
        let image = UIImage(named: "Pic1")
        let imageView = UIImageView(image: image)
        self.view.addSubview(imageView)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
