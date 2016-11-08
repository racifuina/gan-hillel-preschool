
//
//  HomeVC.swift
//  Gan Hillel
//
//  Created by Rigoberto Acifuina on 6/11/15.
//  Copyright © 2015 Rigoberto Acifuina. All rights reserved.


import UIKit
import Parse
import MWPhotoBrowser


class HomeVC: UIViewController, MWPhotoBrowserDelegate {
    var photos = [MWPhoto]()
    
    @IBOutlet weak var calendarioSeccionButton: UIButton!
    @IBOutlet weak var seccionLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewControllerWithIdentifier("AdsVC") as! AdsVC
        self.presentViewController(vc, animated: true, completion: nil)

    }
    
    override func viewWillAppear(animated: Bool) {
        let currentUser = PFUser.currentUser()
        //PFUser.logOut()
        if currentUser != nil {
            photos = []
            buscarCalendarios()
        }
        
        if  SECCIONACTUAL != "" {
            seccionLabel.text = "Sección Actual: \(SECCIONACTUAL)"
        } else {
            seccionLabel.text = "Ninguna Sección Seleccionada"
        }
        
        
        
    }
 
    override func viewDidAppear(animated: Bool) {
        let currentUser = PFUser.currentUser()
        if currentUser != nil {
            // Do stuff with the user
                    } else {
            // Show the signup or login screen
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewControllerWithIdentifier("LoginViewController") as! Inicio
            self.presentViewController(vc, animated: true, completion: nil)
        }
    }
    
    
    
    
    @IBAction func calendarioSeccionButtonPressed(sender: AnyObject) {
        if photos.isEmpty {
            let message = UIAlertController(title: "Calendarios", message: "No hay calendarios Disponibles", preferredStyle: UIAlertControllerStyle.Alert)
            message.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(message, animated: true, completion: nil)
        } else {
            crearBrowser()
        }
    }
    
    
    
    
    func crearBrowser(){
        
        let browser = MWPhotoBrowser()
        browser.delegate = self
        browser.displayActionButton = true; // Show action button to allow sharing, copying, etc (defaults to YES)
        browser.displayNavArrows = false; // Whether to display left and right nav arrows on toolbar (defaults to NO)
        browser.displaySelectionButtons = false; // Whether selection buttons are shown on each image (defaults to NO)
        browser.zoomPhotosToFill = true; // Images that almost fill the screen will be initially zoomed to fill (defaults to YES)
        browser.alwaysShowControls = false; // Allows to control whether the bars and controls are always visible or whether they fade away to show the photo full (defaults to NO)
        browser.enableGrid = false; // Whether to allow the viewing of all the photo thumbnails on a grid (defaults to YES)
        browser.startOnGrid = false; // Whether to start on the grid of thumbnails instead of the first photo (defaults to NO)
        browser.autoPlayOnAppear = true;
        self.navigationController?.pushViewController(browser, animated: true)
    }
    
    func buscarCalendarios () {
        
        let query = PFQuery(className: "Calendarios")
        query.whereKey("seccion", equalTo: SECCIONACTUAL)
        query.addDescendingOrder("fecha")
        
        query.findObjectsInBackgroundWithBlock { (objects: [PFObject]?, error: NSError?) -> Void in
            for object in objects! {
                
                let userImageFile = object["imagen"] as! PFFile
                userImageFile.getDataInBackgroundWithBlock {
                    (imageData: NSData?, error: NSError?) -> Void in
                    if error == nil {
                        if let imageData = imageData {
                            let image = UIImage(data:imageData)
                            let calendario = MWPhoto(image: image)
                            self.photos.append(calendario)
                        }
                    }
                }
            }
        }
    }
    
    // MARK - MWPhotoBrowserDelegate
    
    func numberOfPhotosInPhotoBrowser(photoBrowser: MWPhotoBrowser!) -> UInt {
        let num = UInt(self.photos.count)
        return num
    }
    
    func photoBrowser(photoBrowser: MWPhotoBrowser!, photoAtIndex index: UInt) -> MWPhotoProtocol! {
        if (index < UInt(self.photos.count)) {
            return self.photos[Int(index)] as MWPhoto
        }
        return nil;
    }
    
    
    
}
