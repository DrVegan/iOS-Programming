//
//  ViewController.swift
//  BeaconTute1_Airport
//
//  Created by Daniel Freeman on 2/08/2016.
//  Copyright © 2016 Daniel Freeman. All rights reserved.
//

import Foundation
import UIKit

// 1. Add the ESTBeaconManagerDelegate protocol
class ViewController: UIViewController, ESTBeaconManagerDelegate  {
    
    
    @IBOutlet weak var PlacesList: UITextView!
    
    
    
    
    // 2. Add the beacon manager and the beacon region
    let beaconManager = ESTBeaconManager()
    let beaconRegion = CLBeaconRegion(
        proximityUUID: UUID(uuidString: "B9407F30-F5F8-466E-AFF9-25556B57FE6D")!,
        identifier: "ranged region")
    
    
    
    // Add the property holding the data.
    // TODO: replace "<major>:<minor>" strings to match your own beacons
    let placesByBeacons = [
        "61014:8459": [
            "Real Foods": 50, // read as: it's 50 meters from
            // "Heavenly Sandwiches" to the beacon with
            // major 6574 and minor 54631
            "Streat": 150,
            "Melbourne Central": 325
        ],
        "18480:63159": [
            "Streat": 20,
            "Real Foods": 100,
            "Melbourne Central": 200
        ],
        "17581:4351": [
            "Melbourne Central": 350,
            "Real Foods": 5000,
            "Streat": 5500
        ]
    ]

    func placesNearBeacon(_ beacon: CLBeacon) -> [String]? {
        let beaconKey = "\(beacon.major):\(beacon.minor)"
        if let places = self.placesByBeacons[beaconKey] {
            let sortedPlaces = Array(places).sorted { $0.1 < $1.1 }.map { $0.0 }
            return sortedPlaces
        }
        return nil
    }
    
    
    private func beaconManager(_ manager: AnyObject, didRangeBeacons beacons: [CLBeacon],
                       in region: CLBeaconRegion) {
        if let nearestBeacon = beacons.first, let places = placesNearBeacon(nearestBeacon) {
            // TODO: update the UI here
            let myplaces = String(describing: places)
            print(places) // TODO: remove after implementing the UI
            PlacesList.text = "\n"
            PlacesList.text = myplaces
            
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 3. Set the beacon manager's delegate
        self.beaconManager.delegate = self
        // 4. We need to request this authorization for every beacon manager
        self.beaconManager.requestAlwaysAuthorization()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.beaconManager.startRangingBeacons(in: self.beaconRegion)
    }
    
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        self.beaconManager.stopRangingBeacons(in: self.beaconRegion)
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

