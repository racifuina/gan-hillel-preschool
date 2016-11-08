//
//  Inicio.swift
//  Gan Hillel
//
//  Created by Rigoberto Acifuina on 12/11/15.
//  Copyright © 2015 Rigoberto Acifuina. All rights reserved.
//

import UIKit
import Parse

class Inicio: UIViewController {
    
    
    @IBOutlet weak var codigoTextField: UITextField!
    @IBOutlet weak var nuevoUsuarioButton: UIButton!
    @IBOutlet weak var usuarioExistenteButton: UIButton!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(animated: Bool) {
        let currentUser = PFUser.currentUser()
        if currentUser != nil {
            self.dismissViewControllerAnimated(true, completion: nil)
        } else {
            // Show the signup or login screen
        }
    }

    @IBAction func nuevoUsuarioButtonPressed(sender: AnyObject) {
        if codigoTextField.text == identificacionGeneral {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewControllerWithIdentifier("SeleccionDeAlumnos") as! SeleccionDeAlumnosVC
            self.presentViewController(vc, animated: true, completion: nil)

        } else {
            let message = UIAlertController(title: "Error", message: "El código es incorrecto.", preferredStyle: UIAlertControllerStyle.Alert)
            message.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(message, animated: true, completion: nil)
        }
    }
    
    @IBAction func usuarioExistenteButtonPressed(sender: AnyObject) {
        if codigoTextField.text == identificacionGeneral {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewControllerWithIdentifier("IniciaSesion") as! ExistenteVC
            self.presentViewController(vc, animated: true, completion: nil)
        } else {
            let message = UIAlertController(title: "Error", message: "El código es incorrecto.", preferredStyle: UIAlertControllerStyle.Alert)
            message.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(message, animated: true, completion: nil)
        }
    }
}
