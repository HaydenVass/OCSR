//
//  ViewController.swift
//  VassHayden_OCSR
//
//  Created by Hayden Vass on 5/19/19.
//  Copyright © 2019 Hayden Vass. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate{
    
    
    @IBOutlet weak var spotNameLabel: UILabel!
    @IBOutlet weak var shapeLabel: UILabel!
    @IBOutlet weak var sizeLabel: UILabel!
    @IBOutlet weak var swellLabel: UILabel!
    @IBOutlet weak var tideLabel: UILabel!
    @IBOutlet weak var windLabel: UILabel!
    
    @IBOutlet weak var popupConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var mapView: MKMapView!
    var coreLocationManager = CLLocationManager();
    var locationManager: LocationManager!

    var allOCSpots: [BeachSpot] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.register(MKMarkerAnnotationView.self, forAnnotationViewWithReuseIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier)
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
            let annotation: MKPointAnnotation = spot
            let savedCoord = CLLocationCoordinate2D(latitude: spot.latitude ?? 0.0, longitude: spot.longitude ?? 0.0)
            annotation.coordinate = savedCoord
            annotation.title = spot.name
            allSpotAnnotations.append(annotation)
        }
        
        mapView.showAnnotations(allSpotAnnotations, animated: true)
    }
    
    //annotation selection
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        //move details onto screen
        animateDetails(duration: 0.1, xAxisConstant: -450)
        animateDetails(duration: 0.3, xAxisConstant: 0)
        //gets beach ID to pull against API
        if let id = (view.annotation as? BeachSpot)?.spotID{
            let strId = String(id)
            configureSpotForecast(urlString: "http://api.spitcast.com/api/spot/forecast/" + strId + "/")
        }
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if let beachAnnotation = mapView.dequeueReusableAnnotationView(withIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier) as? MKMarkerAnnotationView{
            beachAnnotation.animatesWhenAdded = true
            beachAnnotation.tintColor = .blue
            beachAnnotation.titleVisibility = .adaptive
            beachAnnotation.canShowCallout = true
            
            return beachAnnotation
        }
        return nil
    }
    
    
    @IBAction func dismissPopOver(_ sender: Any) {
        animateDetails(duration: 0.3, xAxisConstant: -450)
    }
    
    
    func animateDetails(duration: Double, xAxisConstant: CGFloat){
        popupConstraint.constant = xAxisConstant
        UIView.animate(withDuration: duration) {
            self.view.layoutIfNeeded()
        }
    }
    
}


