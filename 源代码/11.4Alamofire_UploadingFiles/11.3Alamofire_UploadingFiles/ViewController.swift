//
//  ViewController.swift
//  11.3Alamofire_UploadingFiles
//
//  Created by 王亮 on 16/7/20.
//  Copyright © 2016年 www.coolketang.com. All rights reserved.
//

import UIKit
import Alamofire
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func touchupInsideUploadingFileBtnAction(_ sender: AnyObject) {
        let fileURL = Bundle.main.url(forResource: "tortoise", withExtension: "png")
        Alamofire.upload(fileURL!,to:"https://httpbin.org/post")
            .validate()
            .responseJSON { response in
                DispatchQueue.main.async{
                    print("上传结果：\(response.result)")
                    let message = "上传结果：\(response.result)"
                    
                    let alert = UIAlertController(title: "Information", message: message, preferredStyle: UIAlertControllerStyle.alert)
                    let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil)
                    alert.addAction(OKAction)
                    self.present(alert, animated: true, completion: nil)
                }
        }
    }
    
    @IBAction func touchupInsideUploadingFileWithProgressBtnAction(_ sender: AnyObject) {
          let fileURL = Bundle.main.url(forResource: "tortoise", withExtension: "png")
        Alamofire.upload(fileURL!,to:"https://httpbin.org/post")
            .uploadProgress { progress in
          
                print("完成比例:\(progress.fractionCompleted)")
                print("当前完成:\(progress.completedUnitCount)")
                print("总共大小:\(progress.totalUnitCount)")
            }
            .validate()
            .responseJSON { response in
                DispatchQueue.main.async{
                    print("上传结果：\(response.result)")
                    let message = "上传结果：\(response.result)"
                    
                    let alert = UIAlertController(title: "Information", message: message, preferredStyle: UIAlertControllerStyle.alert)
                    let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil)
                    alert.addAction(OKAction)
                    self.present(alert, animated: true, completion: nil)
                }
        }
    }
    
    @IBAction func touchupInsideUploadingFileWithMultiPartBtnAction(_ sender: AnyObject) {
        let unicornImageURL = Bundle.main.url(forResource: "tortoise", withExtension: "png")
        let rainbowImageURL = Bundle.main.url(forResource: "tortoise", withExtension: "png")
        Alamofire.upload(
            multipartFormData: { multipartFormData in
                multipartFormData.append(unicornImageURL!, withName: "unicorn")
                multipartFormData.append(rainbowImageURL!, withName: "rainbow")
            } ,to: "https://httpbin.org/post",
            encodingCompletion: { encodingResult in
                switch encodingResult {
                case .success(let upload, _, _):
                    upload.responseJSON { response in
                        debugPrint(response)
                    }
                case .failure(let encodingError):
                    print(encodingError)
                }
            }
            )
    }
}

