//
//  MAP.swift
//  collegeProfileBuilder
//
//  Created by VLindsey on 2/11/16.
//  Copyright © 2016 Valerie. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class MAP: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate
{
    
    let myLocationManager = CLLocationManager()
    
    @IBOutlet weak var myMapView: MKMapView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        myLocationManager.delegate = self
        myLocationManager.requestAlwaysAuthorization() //message asks to find location
        myLocationManager.startUpdatingLocation() //updates the location
        
        myMapView.delegate = self
        myMapView.showsUserLocation = true //lil dot that u
        myMapView.userLocation.title = "My Location"
        
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation])
    {
        print(myLocationManager.location) //gives you coordinates of location
    }
    
    func addPinAnnotation()
    {
        let myCoordinates = CLLocationCoordinate2DMake(42.155725, -88.136782)
        let myAnnotation = MKPointAnnotation()
        myAnnotation.title = "Catlow"
        myAnnotation.subtitle = "Movie Theater"
        myAnnotation.coordinate = myCoordinates
        myMapView.addAnnotation(myAnnotation)
        
        //setCenterOfMap(myCoordinates)
        setCenterOfMap((myLocationManager.location?.coordinate)!)
    }
    
    func setCenterOfMap(Location: CLLocationCoordinate2D)
    {
        let mySpan = MKCoordinateSpan(latitudeDelta: 0.007, longitudeDelta: 0.007)
        let myRegion = MKCoordinateRegion(center: Location, span: mySpan)
        myMapView.setRegion(myRegion, animated: true)
        
    }

}
