//
//  ViewController.swift
//  TouchEvent_TouchView
//
//  Created by CoderDream on 2019/4/15.
//  Copyright © 2019 CoderDream. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var imageView : UIImageView!
    // 标识用户是否点击了图像视图
    var isTouchInImageView : Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let image = UIImage(named: "star")
        self.imageView = UIImageView(image: image)
        self.view.addSubview(self.imageView)
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // 获取一个UITouch对象
        let touch = touches.first
        //print("\(String(describing: touch))")
        // 通过 UITouch 对象的 location(in:) 方法获得在当前视图控制器根视图的位置
        let touchPoint = touch?.location(in: self.view)
        print("\(touches.count)")
        
        let imageViewFrame = self.imageView.frame
        let minX = imageViewFrame.origin.x
        let minY = imageViewFrame.origin.y
        let maxX = minX + imageViewFrame.size.width
        let maxY = minY + imageViewFrame.size.height
        print("minX:\(minX); minY:\(minY); maxX:\(maxX); maxY:\(maxY); ")
        let touchPointX = touchPoint?.x
        let touchPointY = touchPoint?.y
        // 根据UITouch的位置和最大值以及最小值进行比较，以判断用户是否点击了图像视图
        print("touchPointX: \(String(describing: touchPointX)),touchPointY: \(String(describing: touchPointY))")
        if touchPointX! >= minX && touchPointX! <= maxX && touchPointY! >= minY && touchPointY! <= maxY {
            isTouchInImageView = true;
            print("您获得一枚星星");
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        //print("touchesMoved")
        if !isTouchInImageView {
           return;
        }
        let touch = touches.first
        let touchPoint = touch?.location(in: self.view)
        let touchPrePoint = touch?.previousLocation(in: self.view)
        let disX = (touchPoint?.x)! - (touchPrePoint?.x)!
        let disY = (touchPoint?.y)! - (touchPrePoint?.y)!
        
        var centerPoint = self.imageView.center
        centerPoint.x += disX
        centerPoint.y += disY
        self.imageView.center = centerPoint
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("touchesEnded")
        isTouchInImageView = false;
    }
}

