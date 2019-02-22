//
//  InternationalNewsViewController.swift
//  SwiftNews
//
//  Created by 王亮 on 16/8/31.
//  Copyright © 2016年 www.coolketang.com. All rights reserved.
//

import UIKit
import ObjectMapper

class InternationalNewsViewController: UIViewController {

    @IBOutlet weak var tabvLayout: UITableView!
    private var arrDatasource: NSArray!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = "国际新闻"
        self.tabvLayout .registerNibClassName(NewsListTableViewCell)

        fetchNewsListData()
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
        JuHeProvider.request(JuHe.GetNewsListByType("guoji")) {(result) -> () in
            NSLog("result: \(result)")
            SVProgressHUD.dismiss()
            switch result {
            case let .Success(response):
                do {
                    
                    let baseModelBean = Mapper<ResNewsListModelBean<ResResultDataBaseModelBean>>().map(try response.mapJSON())
                    NSLog("baseModelBean: \(baseModelBean?.reason)")
                    
                    if let result = baseModelBean?.result {
                        self.arrDatasource = result.data
                        self.tabvLayout.reloadData()
                        for item in result.data! {
                            NSLog("title:"+item.title!)
                            NSLog("author:"+item.author_name!)
                        }
                    }
                    
                } catch {
                    
                }
                
            case let .Failure(error):
                guard let error = error as? CustomStringConvertible else {
                    break
                }
                SVProgressHUD.showErrorWithStatus("服务异常稍后再试!\(error)")
                
            }
            
        }
        
    }
}
