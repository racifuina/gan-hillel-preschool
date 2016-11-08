//
//  AdsVC.swift
//  Gan Hillel
//
//  Created by Rigoberto Acifuina on 1/02/16.
//  Copyright © 2016 Rigoberto Acifuina. All rights reserved.
//

import UIKit
import ParseUI
import Parse


class AdsVC: UIViewController {

    @IBOutlet weak var adImage: PFImageView!
    @IBOutlet weak var closeButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        closeButton.hidden = true
        loadAds ()
        NSTimer.scheduledTimerWithTimeInterval(5, target: self, selector: "button", userInfo: nil, repeats: false)
    }
    
    @IBAction func closeButtonPressed(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    func button () {
        self.closeButton.hidden = false
        
    }
    
    
    func loadAds () {
        
        let query = PFQuery(className: "Publicidad")
        query.whereKey("titulo", equalTo: "publicidad")
        query.findObjectsInBackgroundWithBlock { (objects: [PFObject]?, error: NSError?) -> Void in
            for object in objects! {
                self.adImage.file = object["imagen"] as? PFFile
                self.adImage.loadInBackground({ (image: UIImage?, error: NSError?) -> Void in
                })
            }
        }
    }
}

