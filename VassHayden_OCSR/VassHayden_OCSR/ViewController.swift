//
//  ViewController.swift
//  VassHayden_OCSR
//
//  Created by Hayden Vass on 5/19/19.
//  Copyright © 2019 Hayden Vass. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    var allOCSpots: [BeachSpot] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configureSpotUrl(urlString: "http://api.spitcast.com/api/county/spots/orange-county/")
        
    }


}

