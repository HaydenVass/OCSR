//
//  ViewController.swift
//  VassHayden_OCSR
//
//  Created by Hayden Vass on 5/19/19.
//  Copyright © 2019 Hayden Vass. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate{
    @IBOutlet weak var mapView: MKMapView!
    var coreLocationManager = CLLocationManager();
    var locationManager: LocationManager!

    var allOCSpots: [BeachSpot] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        coreLocationManager.delegate = self
        locationManager = LocationManager.sharedInstance
        configureSpotUrl(urlString: "http://api.spitcast.com/api/county/spots/orange-county/")
        let authorizationCode = CLLocationManager.authorizationStatus()

        if authorizationCode == CLAuthorizationStatus.notDetermined && coreLocationManager.responds(to: #selector(CLLocationManager.requestAlwaysAuthorization)) ||
            coreLocationManager.responds(to: Selector(("requestWhenInUseAuthroization"))){
            if (Bundle.main.object(forInfoDictionaryKey: "NSLocationAlwaysUsageDescription") != nil){
                print(1)
                coreLocationManager.requestAlwaysAuthorization();
            }else{
                print("no descriptiong provided")
            }
        }else{
            //if the user has given permission the spots will be plotted on the map
            //pointSpotPlots()
        }
    }
    
    func pointSpotPlots(){
        // loop through all spots returned from async task and create CL location cooridante objects from their lats / longs
        //turn them into point annotations and add them to the list
        var allSpotAnnotations: [MKPointAnnotation] = []
        for spot in allOCSpots{
            print(allOCSpots.count)
            let savedCoord = CLLocationCoordinate2D(latitude: spot.latitude ?? 0.0, longitude: spot.longitude ?? 0.0)
            let annotation = MKPointAnnotation()
            
            annotation.coordinate = savedCoord
            allSpotAnnotations.append(annotation)
        }
        
        mapView.showAnnotations(allSpotAnnotations, animated: true)
        
    }


}

