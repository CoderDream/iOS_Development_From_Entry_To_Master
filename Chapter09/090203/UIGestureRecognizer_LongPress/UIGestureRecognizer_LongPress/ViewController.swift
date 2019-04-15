//
//  ViewController.swift
//  UIGestureRecognizer_LongPress
//
//  Created by CoderDream on 2019/4/15.
//  Copyright © 2019 CoderDream. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var imageView : UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let rect = CGRect(x: 0, y: 80, width: 320, height: 320)
        self.imageView = UIImageView(frame: rect)
        
        let image = UIImage(named: "lock")
        imageView.image = image
        
        imageView.isUserInteractionEnabled = true
        self.view.addSubview(self.imageView)
        
        let guesture = UILongPressGestureRecognizer(target: self, action:#selector(ViewController.longPress(_:)))
        // 持续最短时间
        guesture.minimumPressDuration = 1.0
        // 手势移动的最大距离
        guesture.allowableMovement = 20.0
        imageView.addGestureRecognizer(guesture)
    }
    
    @objc func longPress(_ gusture:UILongPressGestureRecognizer) {
        if gusture.state == UIGestureRecognizer.State.began {
            let image = UIImage(named: "unlock")
            imageView.image = image
        }
    }
}
