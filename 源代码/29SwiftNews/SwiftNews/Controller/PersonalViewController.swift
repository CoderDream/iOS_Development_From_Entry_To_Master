//
//  PersonalViewController.swift
//  SwiftNews
//
//  Created by 王亮 on 16/8/31.
//  Copyright © 2016年 www.coolketang.com. All rights reserved.
//
import ObjectMapper
import UIKit
import LeanCloud
class PersonalViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var barBtn: UIBarButtonItem!
    
    @IBOutlet weak var imgvHeader: UIImageView!
    
    @IBOutlet weak var tabvLayout: UITableView!
    
    private var arrDatasource: NSMutableArray = NSMutableArray()
    
    @IBOutlet weak var imgHeader: UIImageView!
    
    @IBOutlet weak var labName: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "我"
        self.tabvLayout.registerNibClassName(NewsListTableViewCell)
        self.tabvLayout.tableFooterView = UIView.init(frame: CGRectZero)

    }
    override func viewWillAppear(animated: Bool) {
         super.viewWillAppear(animated)
        loadData()
        self.changeLoginState()
    }
    
    func loadData() -> Void {
        self.arrDatasource.removeAllObjects()
        self.labName.text = currentUser?.nickname
        self.imgHeader.kf_showIndicatorWhenLoading = true
        self.imgHeader.kf_setImageWithURL(NSURL(string: (currentUser?.rawData["figureurl_qq_2"] ?? "") as! String)!, placeholderImage: UIImage(named: "默认头像"))
        
        let query = LCQuery(className: "ResResultDataBaseModelBean")
        
         query.whereKey("uid",LCQuery.Constraint.MatchedSubstring(currentUser?.uid ?? ""))
        SVProgressHUD.show()
        query.find({ (result) in
            SVProgressHUD.dismiss()
            if(result.isSuccess){
                let todos = result.objects
                for todo in todos! {
                   let modelBean = Mapper<ResResultDataBaseModelBean>().map(todo.JSONString)
                    NSLog("todo:\(modelBean)")
                    self.arrDatasource.addObject(modelBean!)
                    self.tabvLayout .reloadData()
                }
            }
        })
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func touchupInsideBarBtnAction(sender: AnyObject) {
        SVProgressHUD.show()
        if currentUser == nil {
            
            ShareSDK.getUserInfo(SSDKPlatformType.TypeQQ) { (state:SSDKResponseState, user:SSDKUser!, error:NSError!) in
                SVProgressHUD.dismiss()
                if (state == SSDKResponseState.Success)
                {
                    currentUser = user
                    self.loadData()
                }
                else
                {
                    currentUser = nil
                    NSLog("error:\(error)");
                    SVProgressHUD.showErrorWithStatus("QQ登录失败:\(error)")
                }
                  self.changeLoginState()
            }
        }else{
            ShareSDK.cancelAuthorize(SSDKPlatformType.TypeQQ)
            currentUser = nil
            SVProgressHUD.dismiss()
            self.loadData()
            self.changeLoginState()
        }
      
    }
  
    // MARK: tableview datasource
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
         return 50
    }
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let vSectionHeader = UIView.init(frame: CGRect(x: 0  , y:0 ,width:tableView.frame.size.width, height:50))
        let labSectionTitle = UILabel(frame: vSectionHeader.frame)
        labSectionTitle.text = "收藏记录"
        labSectionTitle.backgroundColor = UIColor.groupTableViewBackgroundColor()
        labSectionTitle.textColor = UIColor.brownColor()
        labSectionTitle.textAlignment = NSTextAlignment.Center
        vSectionHeader.addSubview(labSectionTitle)
        return vSectionHeader
    }
    internal func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return self.arrDatasource.count ;
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
    
    func changeLoginState() -> Void {
        
        if currentUser == nil {
            self.barBtn.title = "登录"
            self.labName.text = "未登录"
        }else{
            self.barBtn.title = "注销"
            
        }
        
    }
    
}
