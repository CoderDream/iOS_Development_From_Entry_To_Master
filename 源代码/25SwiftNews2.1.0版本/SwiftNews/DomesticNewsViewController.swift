//
//  ViewController.swift
//  SwiftNews
//
//  Created by 王亮 on 16/8/19.
//  Copyright © 2016年 www.coolketang.com. All rights reserved.
//
//import PrefixHeader.swift
import UIKit
import Alamofire
import ObjectMapper
import AlamofireObjectMapper
class DomesticNewsViewController: UIViewController ,UITableViewDataSource,UITableViewDelegate{

    @IBOutlet weak var tabvLayout: UITableView!
    private var arrDatasource: NSArray!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.title = "国内新闻"
//        self.tabBarController?.tabBar.tintColor = UIColor.clearColor().colorWithAlphaComponent(0.5)
//        self.tabBarItem.image = UIImage(named: "China")
//        self.tabBarItem.selectedImage = UIImage(named: "ChinaBlack")
        self.tabvLayout .registerNibClassName(NewsListTableViewCell)
//        self.tabBarController?.tabBar.tintColor = 
//            UIColor.init(colorLiteralRed: 255, green: 0, blue: 0, alpha: 1)
        
        
        
        fetchNewsListData()
        
//        
//        let URL = "https://v.juhe.cn/toutiao/index?type=top&key=e5ed6b5b55675ab54f8d86d098289761"
//        
//        Alamofire.request(.GET, URL).responseObject { (response: Response<ResNewsListModelBean, NSError>) in
//            
//            let baseModelBean = response.result.value
//            print(baseModelBean?.reason)
//            
//            if let result = baseModelBean?.result {
//                for item in result.data! {
//                    print("title:"+item.title!)
//                    print("author:"+item.author_name!)
//                }
//            }
//        }
        
        
//        ShareSDK.getUserInfo(SSDKPlatformType.TypeQQ) { (state:SSDKResponseState, user:SSDKUser!, error:NSError!) in
//            if (state == SSDKResponseState.Success)
//            {
//                print("uid=\(user.uid)");
//                print("user.credential\(user.credential)");
//                print("token=\(user.credential.token)");
//                print("nickname=\(user.nickname)");
//            }
//                
//            else
//            {
//                print("error:\(error)");
//            }
//        }
    }
    


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: tableview datasource
    internal func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return self.arrDatasource?.count ?? 0;
    }
    
    internal func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat{
        return 90
    }
 
    internal func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
         
     
        let cell = self.tabvLayout.dequeueReusableCellWithIdentifier(String(NewsListTableViewCell), forIndexPath: indexPath) as? NewsListTableViewCell
        let modelBean = self.arrDatasource .objectAtIndex(indexPath.row) as! ResResultDataBaseModelBean
        cell! .updateViews(modelBean )
        return cell!
    }
    
    internal func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){
        let vc = NewsDetailsViewController .instantiateViewController("NewsDetails") as? NewsDetailsViewController
        let modelBean = self.arrDatasource .objectAtIndex(indexPath.row) as! ResResultDataBaseModelBean
        vc?.modelBean = modelBean
        vc?.hidesBottomBarWhenPushed = true
        self.navigationController!.pushViewController(vc!, animated: true)
    }
    
    
    
    /**
     新闻接口请求数据
     */
    func fetchNewsListData() {
        SVProgressHUD.show()
        JuHeProvider.request(JuHe.GetNewsListByType("shehui")) {(result) -> () in
            print("result: \(result)")
            SVProgressHUD .dismiss()
            switch result {
            case let .Success(response):
                do {
                    
                    let baseModelBean = Mapper<ResNewsListModelBean<ResResultDataBaseModelBean>>().map(try response.mapJSON())
                    print("baseModelBean: \(baseModelBean?.reason)")
                    
                    if let result = baseModelBean?.result {
                        self.arrDatasource = result.data
                        self.tabvLayout.reloadData()

                    }

                } catch {
                    
                }
                
            case let .Failure(error):
                guard let error = error as? CustomStringConvertible else {
                    break
                }
            
            }

        }

    }

}

