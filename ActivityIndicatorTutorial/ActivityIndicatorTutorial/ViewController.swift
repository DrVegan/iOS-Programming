//
//  ViewController.swift
//  ActivityIndicatorTutorial
//
//  Created by Daniel Freeman on 21/01/2016.
//  Copyright © 2016 Daniel Freeman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!
    
    @IBAction func startSpinning(sender: UIButton) {
        activityIndicatorView.startAnimating()
    }
    
    @IBAction func stopSpinning(sender: UIButton) {
        activityIndicatorView.stopAnimating()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

