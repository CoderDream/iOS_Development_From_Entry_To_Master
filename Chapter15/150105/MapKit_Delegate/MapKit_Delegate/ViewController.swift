//
//  ViewController.swift
//  MapKit_Delegate
//
//  Created by CoderDream on 2019/3/11.
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
        
        let coordinate2D = CLLocationCoordinate2D(latitude: 39.915352, longitude: 116.397105)
        let zoomLevel = 0.02
        let region = MKCoordinateRegion.init(center: coordinate2D, span: MKCoordinateSpan(latitudeDelta: zoomLevel, longitudeDelta: zoomLevel))
        mapView.setRegion(region, animated: true)
        
        self.view.addSubview(mapView)
    }

    func mapView(_ mapView: MKMapView, regionWillChangeAnimated animated: Bool) {
        print("当前方法为：regionWillChangeAnimated ")
    }
    
    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        print("当前方法为：regionDidChangeAnimated ")
    }
    
    func mapViewWillStartLoadingMap(_ mapView: MKMapView) {
        print("当前方法为：mapViewWillStartLoadingMap ")
    }
    
    func mapViewWillStartRenderingMap(_ mapView: MKMapView) {
        print("当前方法为：mapViewWillStartRenderingMap ")
    }
    
    func mapViewDidFinishLoadingMap(_ mapView: MKMapView) {
        print("当前方法为：mapViewDidFinishLoadingMap ")
    }
    
    func mapViewDidFinishRenderingMap(_ mapView: MKMapView, fullyRendered: Bool) {
        print("当前方法为：mapViewDidFinishRenderingMap ")
    }

}

