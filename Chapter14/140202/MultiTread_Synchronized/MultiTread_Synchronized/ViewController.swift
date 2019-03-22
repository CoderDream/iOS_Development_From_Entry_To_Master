//
//  ViewController.swift
//  MultiTread_Synchronized
//
//  Created by CoderDream on 2019/3/22.
//  Copyright © 2019 CoderDream. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var booksCount = 100
    var soldBooksCount = 0
    var lock : NSLock!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        lock = NSLock()
        
        let salesmanA = Thread(target: self, selector: #selector(ViewController.sellBook), object: nil)
        salesmanA.name = "销售员甲"
        salesmanA.start()
        
        let salesmanB = Thread(target: self, selector: #selector(ViewController.sellBook), object: nil)
        salesmanB.name = "销售员乙"
        salesmanB.start()
        
        let salesmanC = Thread(target: self, selector: #selector(ViewController.sellBook), object: nil)
        salesmanC.name = "销售员丙"
        salesmanC.start()
    }

    @objc func sellBook() {
        while true {
            //lock.lock()
            if booksCount > 0 {
                Thread.sleep(forTimeInterval: 0.01)
                
                soldBooksCount += 1
                booksCount -= 1
                let threadName = Thread.current.name
                
                print("当前销售员为：\(String(describing: threadName))，此时已售书：\(soldBooksCount)本，还剩余：\(booksCount)本。")
            }
            else {
                Thread.exit()
            }
            //lock.unlock()
        }
    }
}
// 如果不加锁，会出现库存为负数的情况
//当前销售员为：Optional("销售员丙")，此时已售书：99本，还剩余：0本。
//当前销售员为：Optional("销售员乙")，此时已售书：100本，还剩余：-1本。
//当前销售员为：Optional("销售员甲")，此时已售书：101本，还剩余：-2本。
