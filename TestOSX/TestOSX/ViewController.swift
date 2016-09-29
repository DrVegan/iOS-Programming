//
//  ViewController.swift
//  TestOSX
//
//  Created by Daniel Freeman on 17/05/2016.
//  Copyright © 2016 Daniel Freeman. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    override func viewDidLoad() {
        if #available(OSX 10.10, *) {
            super.viewDidLoad()
        } else {
            // Fallback on earlier versions
        }

        // Do any additional setup after loading the view.
    }

    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }


    @IBAction func jjj(sender: AnyObject) {
    }
}

