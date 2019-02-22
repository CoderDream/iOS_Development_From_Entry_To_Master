//
//  ViewController.swift
//  15.4.2MultiTread_GCDGroup
//
//  Created by Jerry on 16/7/26.
//  Copyright © 2016年 www.coolketang.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print("开始任务，并显示Loading动画。")
        let group = DispatchGroup()
        let globalQueue = DispatchQueue.global()
        
        globalQueue.async(group: group, execute:  {_ in
            print("从远程服务器加载用户头像。")
        })
        
        globalQueue.async(group: group, execute:  {_ in
            print("根据用户id获得年度所有的交易额纪录。")
        })
        
        group.notify(queue: globalQueue, execute: {_ in
            print("完成所有任务，隐藏Loading动画。")
        })
        
        globalQueue.async(group: group, execute:  {_ in
            print("根据用户id获得所有被用户收藏的商品名称。")
        })
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

