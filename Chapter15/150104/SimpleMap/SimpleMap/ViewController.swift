//
//  ViewController.swift
//  SimpleMap
//
//  Created by CoderDream on 2019/3/11.
//  Copyright © 2019 CoderDream. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let mapView = MKMapView(frame: self.view.bounds)
        mapView.mapType = MKMapType.standard
        mapView.showsScale = true
        mapView.showsTraffic = true
        mapView.showsPointsOfInterest = true
        
        let coordinate2D = CLLocationCoordinate2D(latitude: 39.915352, longitude: 116.397105)
        let zoomLevel = 0.02
        let region = MKCoordinateRegion.init(center: coordinate2D, span: MKCoordinateSpan(latitudeDelta: zoomLevel, longitudeDelta: zoomLevel))
        mapView.setRegion(region, animated: true)
        
        // 缩放
        //map.r
        
        self.view.addSubview(mapView)
    }


}

