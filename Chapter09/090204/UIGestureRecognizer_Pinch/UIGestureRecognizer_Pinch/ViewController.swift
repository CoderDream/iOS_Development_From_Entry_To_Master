//
//  ViewController.swift
//  UIGestureRecognizer_Pinch
//
//  Created by CoderDream on 2019/4/15.
//  Copyright © 2019 CoderDream. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let rect = CGRect(x: 0, y: 80, width: 320, height: 320)
        let imageView = UIImageView(frame: rect)
        
        let image = UIImage(named: "hand")
        imageView.image = image
        
        imageView.isUserInteractionEnabled = true
        self.view.addSubview(imageView)
        
        let guesture = UIPinchGestureRecognizer(target: self, action:#selector(ViewController.pinchImage(_:)))
        imageView.addGestureRecognizer(guesture)
    }
    
    @objc func pinchImage(_ recognizer:UIPinchGestureRecognizer) {
        recognizer.view?.transform = (recognizer.view?.transform.scaledBy(x: recognizer.scale, y: recognizer.scale))!
        //recognizer.view?.transform = transform!
        recognizer.scale = 1;
    }
}
