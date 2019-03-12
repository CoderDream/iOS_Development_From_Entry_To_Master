//
//  ViewController.swift
//  MapKit_Camera
//
//  Created by CoderDream on 2019/3/12.
//  Copyright © 2019 CoderDream. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let mapView = MKMapView(frame: self.view.bounds)
        mapView.delegate = self
        mapView.mapType = MKMapType.standard
        
        let center = CLLocationCoordinate2DMake(39.915352, 116.397105)
        let fromEye = CLLocationCoordinate2DMake(39.915352 + 0.1, 116.397105 + 0.1)
        let altitude : CLLocationDistance = 100
        let camera = MKMapCamera(lookingAtCenter: center, fromEyeCoordinate: fromEye, eyeAltitude: altitude)
        mapView.camera = camera        
        
        self.view.addSubview(mapView)
    }


}

