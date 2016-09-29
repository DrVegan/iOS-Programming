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
    
    

    @IBOutlet weak var label0: UILabel!
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label4: UILabel!
    @IBOutlet weak var label5: UILabel!
    
    var locationManager: CLLocationManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.requestAlwaysAuthorization()
        
        view.backgroundColor = UIColor.gray
        self.label0.text = "label 0"
        self.label1.text = "label 1"
        self.label2.text = "label 2"
        self.label3.text = "label 3"
        self.label4.text = "label 4"
        self.label5.text = "label 5"
        
        
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
        
        let numberOfBeacons = beacons.count
        print("Number of Beacons: \(numberOfBeacons)")
        
        
        
        if numberOfBeacons > 0{
            for num in 0...numberOfBeacons-1{
                switch num {
                case 0:
                    update(beacon: beacons[num], label: label0)
                case 1:
                    update(beacon: beacons[num], label: label1)
                case 2:
                    update(beacon: beacons[num], label: label2)
                case 3:
                    update(beacon: beacons[num], label: label3)
                case 4:
                    update(beacon: beacons[num], label: label4)
                case 5:
                    update(beacon: beacons[num], label: label5)
                    
                default:
                        print("Default SwitchCase")
                    
                }
            }
        }else{
            print("NO BEACONS FOUND, Count is 0")
        }
    }
      
    func startScanning() {
        let uuid = UUID(uuidString: "B9407F30-F5F8-466E-AFF9-25556B57FE6D")!
        //let beaconRegion = CLBeaconRegion(proximityUUID: uuid, major: 61014, minor: 8459, identifier: "MyBeacon")
        let beaconRegion = CLBeaconRegion(proximityUUID: uuid, identifier: "Dan's Beacons")
        
        locationManager.startMonitoring(for: beaconRegion)
        locationManager.startRangingBeacons(in: beaconRegion)
    }
    
    func update(beacon: CLBeacon, label: UILabel) {
        UIView.animate(withDuration: 0.8) { [unowned self] in
            self.view.backgroundColor = UIColor.gray
            
            switch beacon.proximity {
            case .unknown:
                label.backgroundColor = UIColor.gray
                label.text = "Maj:\(beacon.major) ProxRaw:\(beacon.proximity.rawValue) ProxHash:\(beacon.proximity.hashValue) Accu:\(beacon.accuracy)"
                
                
            case .far:
                label.backgroundColor = UIColor.blue
                label.text = "Maj:\(beacon.major) ProxRaw:\(beacon.proximity.rawValue) ProxHash:\(beacon.proximity.hashValue) Accu:\(beacon.accuracy)"
                
            case .near:
                label.backgroundColor = UIColor.orange
                label.text = "Maj:\(beacon.major) ProxRaw:\(beacon.proximity.rawValue) ProxHash:\(beacon.proximity.hashValue) Accu:\(beacon.accuracy)"
                
            case .immediate:
                label.backgroundColor = UIColor.red
                label.text = "Maj:\(beacon.major) ProxRaw:\(beacon.proximity.rawValue) ProxHash:\(beacon.proximity.hashValue) Accu:\(beacon.accuracy)"
                
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

