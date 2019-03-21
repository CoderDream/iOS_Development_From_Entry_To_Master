//
//  ViewController.swift
//  UICollectionViewSample
//
//  Created by CoderDream on 2019/3/21.
//  Copyright © 2019 CoderDream. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var images = ["Pic1", "Pic2", "Pic3", "Pic8", "Pic5", "Pic6", "Pic7", "Pic4", "Pic9"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let screenRect = UIScreen.main.bounds
        let rect = CGRect(x: 0, y: 20, width: screenRect.size.width, height: screenRect.size.height - 20)
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(width: screenRect.width / 2 - 10, height: (screenRect.width / 2 - 10) * 335 / 500)//CGSize(width: 155, height: 135)
        flowLayout.scrollDirection = UICollectionView.ScrollDirection.vertical
        
        let collectionView = UICollectionView(frame: rect, collectionViewLayout: flowLayout)
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UICollectionViewCell.classForCoder(), forCellWithReuseIdentifier: "reusedCell")
        self.view.addSubview(collectionView)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let identifier = "reusedCell"
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath)
        let screenRect = UIScreen.main.bounds
        let imageView:UIImageView? = cell.viewWithTag(1) as? UIImageView
        if imageView == nil {
            let image = UIImage(named: images[(indexPath as NSIndexPath).row])
            let imageView = UIImageView(image: image)
            imageView.frame = CGRect(x: 5, y: 0, width: screenRect.width / 2 - 10, height: (screenRect.width / 2 - 10) * 335 / 500)
            imageView.layer.opacity = 0.5
            imageView.tag = 1
            cell.addSubview(imageView)
        }
        else {
            imageView?.image = UIImage(named: images[(indexPath as NSIndexPath).row])
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        let imageView = cell?.viewWithTag(1)
        imageView?.layer.opacity = 1.0;
    }
}
