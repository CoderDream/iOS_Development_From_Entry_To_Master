//
//  ViewController.swift
//  StoryboardProject_UIControl
//
//  Created by CoderDream on 2019/2/28.
//  Copyright © 2019 CoderDream. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var currentImageNum = 1
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var picName: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func nextPicture(_ sender: UIButton) {
        currentImageNum += 1
        let picture = "Pic\(currentImageNum)"
        imageView.image = UIImage(named: picture)
        picName.text = picture
    }
    
}

