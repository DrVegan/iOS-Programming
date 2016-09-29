//
//  ViewController.swift
//  ChuckNorris
//
//  Created by Brian on 8/26/15.
//  Copyright © 2015 Razeware. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let generator = JokeGenerator()
        for index in 0 ..< 3 {
            let joke = generator.randomJoke()
            print("Random joke \(index): \(joke)")
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

