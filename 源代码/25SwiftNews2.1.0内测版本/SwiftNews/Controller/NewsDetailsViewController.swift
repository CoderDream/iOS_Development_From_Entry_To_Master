//
//  NewsDetailsViewController.swift
//  SwiftNews
//
//  Created by 王亮 on 16/8/31.
//  Copyright © 2016年 www.coolketang.com. All rights reserved.
//


import UIKit
import LeanCloud
class NewsDetailsViewController: UIViewController,UIWebViewDelegate,LGPlusButtonsViewDelegate {
    
    var modelBean:ResResultDataBaseModelBean!
    @IBOutlet weak var webvNewsContent: UIWebView!
    var plusButtonsViewNavBar:LGPlusButtonsView = LGPlusButtonsView.init(numberOfButtons: 2, firstButtonIsPlusButton: false , showAfterInit: false)
 
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(barButtonSystemItem: UIBarButtonSystemItem.Add, target: self, action: #selector(NewsDetailsViewController.showHideButtonsAction))
   
        self.title = self.modelBean?.title ?? "突发新闻"
        // Do any additional setup after loading the view.
        SVProgressHUD.show()
        webvNewsContent.loadRequest(NSURLRequest.init(URL: NSURL(string: modelBean.url!)!))
    }
    
    override func viewWillAppear(animated: Bool) {
         super.viewWillAppear(animated)
     
        self.plusButtonsViewNavBar.position = LGPlusButtonsViewPosition.RightTop
        self.plusButtonsViewNavBar.offset = CGPoint(x: 0,y: 80)
        self.plusButtonsViewNavBar.delegate = self
        self.plusButtonsViewNavBar.showHideOnScroll = true;
        self.plusButtonsViewNavBar.appearingAnimationType = LGPlusButtonsAppearingAnimationType.CrossDissolveAndSlideVertical
        self.plusButtonsViewNavBar.plusButtonAnimationType = LGPlusButtonAnimationType.CrossDissolve
        self.plusButtonsViewNavBar.setButtonsTitles(["分享", "收藏"], forState: UIControlState.Normal)
        self.plusButtonsViewNavBar.setButtonsTitleFont(UIFont.boldSystemFontOfSize(20), forOrientation: LGPlusButtonsViewOrientation.All)
        self.plusButtonsViewNavBar.setButtonsSize( CGSize(width: 52.0, height: 52.0), forOrientation: LGPlusButtonsViewOrientation.All)
        self.plusButtonsViewNavBar.setButtonsLayerCornerRadius(52.0/2.0, forOrientation: LGPlusButtonsViewOrientation.All)
        self.plusButtonsViewNavBar.setButtonsBackgroundColor(UIColor.init(red: 0.0, green: 0.5, blue: 1, alpha: 1), forState:UIControlState.Normal)
        self.plusButtonsViewNavBar.setButtonsBackgroundColor(UIColor.init(red:0.2 ,green:0.6 ,blue:1, alpha:1), forState: UIControlState.Highlighted)
        
        self.plusButtonsViewNavBar .setButtonsLayerShadowColor(UIColor .init(red:0.1 ,green:0.1 ,blue:0.1 ,alpha:1))
        self.plusButtonsViewNavBar .setButtonsLayerShadowOpacity(0.5);
        self.plusButtonsViewNavBar .setButtonsLayerShadowRadius(3);
        self.plusButtonsViewNavBar .setButtonsLayerShadowOffset(CGSize(width: 0, height: 2))
        self.plusButtonsViewNavBar .setDescriptionsTextColor(UIColor.whiteColor());
        self.plusButtonsViewNavBar .setDescriptionsBackgroundColor(UIColor.init(white: 0, alpha: 0.66));
        
        self.plusButtonsViewNavBar .setDescriptionsLayerCornerRadius(6, forOrientation:LGPlusButtonsViewOrientation.All);
        self.plusButtonsViewNavBar .setDescriptionsContentEdgeInsets(UIEdgeInsetsMake(4, 8, 4, 8) ,forOrientation:LGPlusButtonsViewOrientation.All);
        
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.Phone)
        {
            self.plusButtonsViewNavBar . setButtonsSize(CGSizeMake(44, 44) ,forOrientation:LGPlusButtonsViewOrientation.Landscape)
            self.plusButtonsViewNavBar . setButtonsLayerCornerRadius(44/2 ,forOrientation:LGPlusButtonsViewOrientation.Landscape)
            self.plusButtonsViewNavBar . setButtonsTitleFont(UIFont.systemFontOfSize(24), forOrientation:LGPlusButtonsViewOrientation.Landscape)
        }
        
        self.webvNewsContent.addSubview(self.plusButtonsViewNavBar);
        
    }
    
    //MARK: webview delegate
    internal func webViewDidFinishLoad(webView: UIWebView){
        SVProgressHUD.dismiss()
    }
    internal func webView(webView: UIWebView, didFailLoadWithError error: NSError?){
        SVProgressHUD.dismiss()
    }
    
    func plusButtonsView(plusButtonsView: LGPlusButtonsView!, buttonPressedWithTitle title: String!, description: String!, index: UInt) {
        
        if index == 0 {
            // 1.创建分享参数
            let shareParames = NSMutableDictionary()
            
            shareParames.SSDKSetupShareParamsByText(self.modelBean.title,
                                                    images : UIImage(named: "swiftColor"),
                                                    url : NSURL(string:self.modelBean.url!),
                                                    title : self.modelBean.title,
                                                    type : SSDKContentType.WebPage)
            
            ShareSDK.showShareActionSheet(nil, items: nil, shareParams: shareParames) { (state:SSDKResponseState, type:SSDKPlatformType, userData:[NSObject : AnyObject]!, contentEntity:SSDKContentEntity!, error:NSError!, end:Bool) in
                
                switch state{
                    
                case SSDKResponseState.Success:
                    NSLog("分享成功")
                    SVProgressHUD.showSuccessWithStatus("分享成功!")
                case SSDKResponseState.Fail:
                     SVProgressHUD.showErrorWithStatus("分享失败,错误描述:\(error)")
                    NSLog("分享失败,错误描述:\(error)")
                    
                case SSDKResponseState.Cancel:
                    SVProgressHUD.showErrorWithStatus("分享取消")
                    NSLog("分享取消")
                    
                default:
                    break
                }
            }
        }else if index == 1{
            
            if currentUser == nil {
                let message = "用户未登陆，请先QQ或微信"
                let alert = UIAlertController(title: "Information", message: message, preferredStyle: .Alert)
                let OKAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
                alert.addAction(OKAction)
 
                self.presentViewController(alert, animated: true, completion: nil)
 
                return
            }else{
                
                let post = LCObject(className: "ResResultDataBaseModelBean")
                post.set("title", value: LCString(self.modelBean?.title ?? ""))
                post.set("date", value: LCString(self.modelBean?.date ?? ""))
                post.set("author_name", value: LCString(self.modelBean?.author_name ?? ""))
                post.set("thumbnail_pic_s", value: LCString(self.modelBean?.thumbnail_pic_s ?? ""))
                post.set("thumbnail_pic_s02", value: LCString(self.modelBean?.thumbnail_pic_s02 ?? ""))
                post.set("thumbnail_pic_s03", value: LCString(self.modelBean?.thumbnail_pic_s03 ?? ""))
                post.set("url", value: LCString(self.modelBean?.url ?? ""))
                post.set("uniquekey", value: LCString(self.modelBean?.uniquekey ?? ""))
                post.set("type", value: LCString(self.modelBean?.type ?? ""))
                post.set("realtype", value: LCString(self.modelBean?.realtype ?? ""))
                post.set("uid", value:LCString(currentUser?.uid  ?? ""))
                post.save { (result:LCBooleanResult) in
                    if result.isSuccess {
                        SVProgressHUD.showSuccessWithStatus("收藏成功!")
                    }else{
                        SVProgressHUD.showErrorWithStatus("收藏失败!")
                    }
                }
            }

        }

    }
    
    // MARK: 
    func showHideButtonsAction()->Void
    {
        
        if (self.plusButtonsViewNavBar.showing){
            self.plusButtonsViewNavBar.hideAnimated(true ,completionHandler:nil);
        }else{
            self.plusButtonsViewNavBar.showAnimated(true ,completionHandler:nil);
        }
    }
}
