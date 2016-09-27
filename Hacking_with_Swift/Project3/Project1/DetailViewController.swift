//
//  DetailViewController.swift
//  Project1
//
//  Created by Daniel Freeman on 7/07/2016.
//  Copyright © 2016 Daniel Freeman. All rights reserved.
//

import UIKit
import Social

class DetailViewController: UIViewController {

    
    @IBOutlet weak var detailImageView: UIImageView!

    var detailItem: String? {
        didSet {
            // Update the view.
            configureView()
        }
        
    }

    func configureView() {
        // Update the user interface for the detail item.
        if let detail = self.detailItem {
            if let imageView = self.detailImageView {
                imageView.image = UIImage(named: detail)
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.configureView()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Action, target: self, action: #selector(shareTapped))
        
        
    }
    
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }
    
    
    func shareTapped() {
        if detailImageView.image != nil{
            
            
            // MARK: Facebook
            let vc = SLComposeViewController(forServiceType: SLServiceTypeFacebook)
            vc.setInitialText("Look at this great picture!")
            vc.addImage(detailImageView.image!)
            vc.addURL(NSURL(string: "http://www.photolib.noaa.gov/nssl"))
            presentViewController(vc, animated: true, completion: nil)
            
            
            //MARK: Share
        /*
        let vc = UIActivityViewController(activityItems: [detailImageView.image!], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        presentViewController(vc, animated: true, completion: nil)
         */
            
            
            
        }else{
            let ac = UIAlertController(title: "Error", message: "Please Select Image First", preferredStyle: .Alert)
            ac.addAction(UIAlertAction(title: "Continue", style: .Default, handler: nil))
            presentViewController(ac, animated: true, completion: nil)
        }
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    

}

