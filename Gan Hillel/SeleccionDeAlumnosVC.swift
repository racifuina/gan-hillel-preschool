//
//  SeleccionDeAlumnosVC.swift
//  Gan Hillel
//
//  Created by Rigoberto Acifuina on 19/11/15.
//  Copyright © 2015 Rigoberto Acifuina. All rights reserved.
//

import UIKit
import Parse

class SeleccionDeAlumnosVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(animated: Bool) {
        let currentUser = PFUser.currentUser()
        if currentUser != nil {
            // Do stuff with the user
            self.dismissViewControllerAnimated(true, completion: nil)
        } else {
            
            // Show the signup or login screen
            
        }
    }

    
    @IBAction func atrasButtonPressed(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }


}
