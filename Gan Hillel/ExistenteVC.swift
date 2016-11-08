//
//  ExistenteVC.swift
//  Gan Hillel
//
//  Created by Rigoberto Acifuina on 12/11/15.
//  Copyright © 2015 Rigoberto Acifuina. All rights reserved.
//

import UIKit
import Parse

class ExistenteVC: UIViewController {

    @IBOutlet weak var atrasNavButton: UIBarButtonItem!
    @IBOutlet weak var usuarioTextField: UITextField!
    @IBOutlet weak var contraseñaTextField: UITextField!
    @IBOutlet weak var idTextField: UITextField!
    var id = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    
    
    @IBAction func atrasButtonPressed(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func ingresoButtonPressed(sender: AnyObject) {
        logUser()
    }

    func logUser(){
        PFUser.logInWithUsernameInBackground(usuarioTextField.text!, password:contraseñaTextField.text!) {
            (user: PFUser?, error: NSError?) -> Void in
            if user != nil {
                // Do stuff after successful login.
                
                usuario = PFUser.currentUser()
                SECCIONACTUAL = usuario!["seccion1"] as! String
                self.dismissViewControllerAnimated(true, completion: nil)
            } else {
                // The login failed. Check error to see why.
                print("Error: \(error!) \(error!.userInfo)")
                let message = UIAlertController(title: "Error", message: "La combinación de Usuario/Contraseña no es valida.", preferredStyle: UIAlertControllerStyle.Alert)
                message.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
                self.presentViewController(message, animated: true, completion: nil)

            }
        }
    }
    
    
}
