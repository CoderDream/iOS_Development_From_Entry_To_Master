//
//  ViewController.swift
//  Alamofire_UploadAndDownloadFile
//
//  Created by CoderDream on 2019/2/25.
//  Copyright © 2019 CoderDream. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func clickNormalUploadBtn(_ sender: UIButton) {
        let fileURL = Bundle.main.url(forResource: "tortoise", withExtension: "png")
        Alamofire.upload(fileURL!, to: "https://httpbin.org/post").validate().responseJSON { response in
            DispatchQueue.main.async {
                let message = "上传结果：\(response.result)"
                print(message)
                let alert = UIAlertController(title: "Information", message: message, preferredStyle: UIAlertController.Style.alert)
                let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
                alert.addAction(okAction)
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
    
    @IBAction func clickShowProcessBtn(_ sender: UIButton) {
        let fileURL = Bundle.main.url(forResource: "tortoise", withExtension: "png")
        Alamofire.upload(fileURL!, to: "https://httpbin.org/post").uploadProgress { progress in
                print("完成比例：\(progress.fractionCompleted)")
                print("当前完成：\(progress.completedUnitCount)")
                print("总共大小：\(progress.totalUnitCount)")
            }.validate().responseJSON { response in
            DispatchQueue.main.async {
                let message = "上传结果：\(response.result)"
                print(message)
                let alert = UIAlertController(title: "Information", message: message, preferredStyle: UIAlertController.Style.alert)
                let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
                alert.addAction(okAction)
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
    
    @IBAction func clickBatchUploadBtn(_ sender: UIButton) {
        let unicornImageURL = Bundle.main.url(forResource: "tortoise", withExtension: "png")
        let rainbowImageURL = Bundle.main.url(forResource: "tortoise", withExtension: "png")
        Alamofire.upload(multipartFormData: { multipartFormData in
            multipartFormData.append(unicornImageURL!, withName: "unicorn")
            multipartFormData.append(rainbowImageURL!, withName: "rainbow")
        }, to: "https://httpbin.org/post", encodingCompletion: { encodingResult in
            switch encodingResult {
            case .success(let upload, _, _):
                upload.responseJSON { response in
                    debugPrint(response)
                }
            case .failure(let encodingError):
                print(encodingError)
            }
        })
    }
    
    @IBAction func clickDownloadBtn(_ sender: UIButton) {
        let destination = DownloadRequest.suggestedDownloadDestination(for: .documentDirectory)
        Alamofire.download("https://httpbin.org/image/png", to: destination).downloadProgress { progress in
                print("完成比例：\(progress.fractionCompleted)")
                print("当前完成：\(progress.completedUnitCount)")
                print("总共大小：\(progress.totalUnitCount)")
            }.responseJSON { response in
                if let data = response.result.value {
                    // Cannot convert value of type 'Any' to expected argument type 'Data'
                    //let image = UIImage(data: data)
                }
                let message = "下载图片结果：\(response.result)"
                print(message)
                let alert = UIAlertController(title: "Information", message: message, preferredStyle: UIAlertController.Style.alert)
                let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
                alert.addAction(okAction)
                self.present(alert, animated: true, completion: nil)
        }
        
    }
}

