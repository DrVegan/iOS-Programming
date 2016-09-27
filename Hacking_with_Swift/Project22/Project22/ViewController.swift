//
//  ViewController.swift
//  Project22
//
//  Created by Daniel Freeman on 23/09/2016.
//  Copyright © 2016 Daniel Freeman. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    var locationManager: CLLocationManager!

    
    @IBOutlet weak var distanceReading: UILabel!
    @IBOutlet weak var secondBeacon: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.requestAlwaysAuthorization()
        
        view.backgroundColor = UIColor.gray
        self.distanceReading.text = "WELCOME"
        
        
    }
    
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedAlways {
            if CLLocationManager.isMonitoringAvailable(for: CLBeaconRegion.self) {
                if CLLocationManager.isRangingAvailable() {
                    // do stuff
                    startScanning()
                }
            }
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didRangeBeacons beacons: [CLBeacon], in region: CLBeaconRegion) {
        print("Nnumber of Beacons: \(beacons.count)")
        if beacons.count == 1{
    
            update(distance: beacons[0].proximity, label: distanceReading)
        }
        if beacons.count == 2{
                    self.secondBeacon.text = "Beacon 2"
            update(distance: beacons[1].proximity, label: secondBeacon)
        }
    }
 
    func startScanning() {
        let uuid = UUID(uuidString: "B9407F30-F5F8-466E-AFF9-25556B57FE6D")!
        //let beaconRegion = CLBeaconRegion(proximityUUID: uuid, major: 61014, minor: 8459, identifier: "MyBeacon")
        let beaconRegion = CLBeaconRegion(proximityUUID: uuid, identifier: "Dan's Beacons")
        
        locationManager.startMonitoring(for: beaconRegion)
        locationManager.startRangingBeacons(in: beaconRegion)
    }
    
    func update(distance: CLProximity, label: UILabel) {
        UIView.animate(withDuration: 0.8) { [unowned self] in
            switch distance {
            case .unknown:
                self.view.backgroundColor = UIColor.gray
                label.text = "UNKNOWN"
                
            case .far:
                self.view.backgroundColor = UIColor.blue
                label.text = "FAR"
                
            case .near:
                self.view.backgroundColor = UIColor.orange
                label.text = "NEAR"
                
            case .immediate:
                self.view.backgroundColor = UIColor.red
                label.text = "RIGHT HERE"
                
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

