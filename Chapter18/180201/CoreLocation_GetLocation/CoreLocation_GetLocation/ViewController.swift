//
//  ViewController.swift
//  CoreLocation_GetLocation
//
//  Created by CoderDream on 2019/3/12.
//  Copyright © 2019 CoderDream. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    var locationManager:CLLocationManager!
    var label:UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.distanceFilter = 1000.0
        
        label = UILabel(frame: CGRect(x: 20, y: 80, width: 280, height: 100))
        label.numberOfLines = 2
        label.backgroundColor = UIColor.brown
        self.view.addSubview(label)
        
        if CLLocationManager.authorizationStatus() == .notDetermined {
            locationManager.requestAlwaysAuthorization()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .denied:
            print("用户拒绝您对地理设备使用的请求")
            break
        default:
            manager.startUpdatingLocation()
            break
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        locationManager.stopUpdatingLocation()
        let location:CLLocation = locations[0]
        let latitude = location.coordinate.latitude
        let longitude = location.coordinate.longitude
        let message = "经度： \(longitude)\n纬度： \(latitude)"
        label.text = message
        print(message)
        //经度： 114.40163186240885
        //纬度： 30.480745575004086
    }

}

