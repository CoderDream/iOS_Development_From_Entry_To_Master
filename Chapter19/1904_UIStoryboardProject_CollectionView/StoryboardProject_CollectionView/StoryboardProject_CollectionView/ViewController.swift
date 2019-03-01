//
//  ViewController.swift
//  StoryboardProject_CollectionView
//
//  Created by CoderDream on 2019/3/1.
//  Copyright © 2019 CoderDream. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    var images = ["Pic1", "Pic2", "Pic3", "Pic4", "Pic5", "Pic6", "Pic7", "Pic8", "Pic9"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        print("collectionView(:cellForItemAt) call")
        let cellIndentifier = "reusedCell"
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIndentifier, for: indexPath)
        let imageView = cell.viewWithTag(1) as! UIImageView
        imageView.layer.opacity = 0.5
        let imageName = images[(indexPath as NSIndexPath).row]
        imageView.image = UIImage(named: imageName)
        
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("collectionView(:didSelectItemAt) call")
        let cell = collectionView.cellForItem(at: indexPath)
        let view = cell?.viewWithTag(1)
        view?.layer.opacity = 1.0
    }
}

