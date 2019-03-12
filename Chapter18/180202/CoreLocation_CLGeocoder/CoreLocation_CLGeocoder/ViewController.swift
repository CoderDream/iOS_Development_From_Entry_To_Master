//
//  ViewController.swift
//  CoreLocation_CLGeocoder
//
//  Created by CoderDream on 2019/3/12.
//  Copyright © 2019 CoderDream. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let geocoder = CLGeocoder()
        
        let latitude = 30.480745575004086
        let longitude = 114.40163186240885
        
        let location = CLLocation(latitude: latitude, longitude: longitude)
        geocoder.reverseGeocodeLocation(location) { (placeMarks: [CLPlacemark]?, error: Error?) in
            if (placeMarks?.count)! > 0 {
                let placeMark = placeMarks?.first
                print(placeMark?.name as Any)
            }
        }
    }


}

