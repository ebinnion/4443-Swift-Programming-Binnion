//
//  SecondViewController.swift
//  MyLocations
//
//  Created by Terry Griffin on 3/24/15.
//  Copyright (c) 2015 mwsu. All rights reserved.
//

import UIKit
import MapKit

class SecondViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    
    func setMapCenter( location: CLLocationCoordinate2D ) {
        let span = MKCoordinateSpanMake(0.05, 0.05)
        let region = MKCoordinateRegion(center: location, span: span)
        mapView.setRegion(region, animated: true)
    }
    
    override func viewWillAppear(animated: Bool) {
        let currentPoint = (self.tabBarController as CustomTabBarController).currentPoint
        
        // If currentPoint is initialized, let's make sure that the map is centered on that point
        if ( currentPoint.initialized ) {
            let location = CLLocationCoordinate2D(
                latitude: currentPoint.lat,
                longitude: currentPoint.lon
            )
            
            setMapCenter(location)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 1
        let currentPoint = (self.tabBarController as CustomTabBarController).currentPoint
        var lat = currentPoint.initialized ? currentPoint.lat : 51.50007773
        var lon = currentPoint.initialized ? currentPoint.lon : -0.1246402
        
        let location = CLLocationCoordinate2D(
            latitude: lat,
            longitude: lon
        )

        // 2
        setMapCenter(location)
        
        //3
        let annotation = MKPointAnnotation()
        annotation.setCoordinate(location)
        annotation.title = "Big Ben"
        annotation.subtitle = "London"
        mapView.addAnnotation(annotation)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
