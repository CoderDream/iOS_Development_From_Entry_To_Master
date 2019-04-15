//
//  ViewController.swift
//  UIGestureRecognizer_DoubleTap
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
        
        let guesture = UITapGestureRecognizer(target: self, action: #selector(ViewController.doubleTap))
        // 点击两次
        guesture.numberOfTapsRequired = 2
        // 一根手指
        guesture.numberOfTouchesRequired = 1
        imageView.addGestureRecognizer(guesture)
    }
    
    @objc func doubleTap() {
        let image = UIImage(named: "unlock")
        imageView.image = image
    }
}
