//
//  NewFeatureViewController.swift
//  SwiftNews
//
//  Created by 王亮 on 16/9/4.
//  Copyright © 2016年 www.coolketang.com. All rights reserved.
//

import UIKit
private let NewFeatureCollectionViewCellIdentifier = "NewFeatureCollectionViewCellIdentifier"
class NewFeatureViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    
    var collectionView:UICollectionView?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
    
    // 设置
    private func setup()
    {
        // 注册CELL
            collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: NewFeatureFlowLayout())
        self.collectionView!.registerClass(NewFeatureCollectionViewCell.self, forCellWithReuseIdentifier: NewFeatureCollectionViewCellIdentifier)
        collectionView?.delegate = self
        collectionView?.dataSource = self
        // 添加pageControll
        collectionView?.addSubview(pageControll)
        self.view.addSubview(collectionView!)
        // 布局
        pageControll.snp_makeConstraints { (make) in
            make.bottom.equalTo(self.view).offset(-10)
            make.centerX.equalTo(self.view)
            make.size.equalTo(CGSize(width: 100, height: 20))
        }
    }
    
    // MARK: - UICollectionViewDataSource
     func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageNames.count ?? 0
    }
    
     func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(NewFeatureCollectionViewCellIdentifier, forIndexPath: indexPath) as!NewFeatureCollectionViewCell
        
        let count = imageNames.count ?? 0
        if count > 0 {
            cell.image = UIImage(named: imageNames[indexPath.item])
            cell.title = titles[indexPath.item]
        }
        return cell
    }
    
    
    // MAKR: - UICollectionViewDelegate
     func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        // 能进入这儿, imageNames.count肯定有值了
        if indexPath.item == imageNames.count - 1 {
            // 进入首页
           let tabBarController = TabBarController.instantiateViewController("Main")
            KeyWindow.rootViewController = tabBarController
        }
    }
    
     func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        let currentPage = Int(scrollView.contentOffset.x / self.view.bounds.width + 0.5)
        // 最后一页不显示pageControll
        pageControll.currentPage = currentPage
        
    }
    
     func scrollViewDidScroll(scrollView: UIScrollView) {
        if scrollView.contentOffset.x/self.view.bounds.width > (CGFloat(imageNames.count) - 1.5){
            pageControll.hidden = true
        }else{
            pageControll.hidden = false
        }
    }
    
    // MARK: - 懒加载
    ///新特性的图片数组
    private let imageNames :[String] = ["iTunesArtworkBG","iTunesArtworkBG","iTunesArtworkBG"]
    private let titles :[String] = ["快","安全","易表达"]
    /// UIPageControl
    private lazy var pageControll : UIPageControl = {
        let pageControll = UIPageControl()
        pageControll.numberOfPages = self.imageNames.count ?? 0
        pageControll.pageIndicatorTintColor = UIColor.whiteColor()
        pageControll.currentPageIndicatorTintColor = UIColor.yellowColor()
        return pageControll
    }()

}


// MARK: - 自定义FlowLayout
class NewFeatureFlowLayout: UICollectionViewFlowLayout {
    override func prepareLayout() {
        super.prepareLayout()
        
        // MARK: 设置Layout
        // 设置itemSize
        itemSize = UIScreen.mainScreen().bounds.size
        // 设置间距
        minimumLineSpacing = 0
        minimumInteritemSpacing = 0
        // 设置方向
        scrollDirection = .Horizontal
        
        // MARK: 设置collectionView
        // 设置分页
        collectionView?.pagingEnabled = true
        // 设置隐藏横竖的滚动条
        collectionView?.showsHorizontalScrollIndicator = false
        collectionView?.showsVerticalScrollIndicator = false
        // 取消弹簧效果
        collectionView?.bounces = false
    }
}
