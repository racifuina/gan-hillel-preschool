//
//  ViewController.swift
//  Gan Hillel
//
//  Created by Rigoberto Acifuina on 2/11/15.
//  Copyright © 2015 Rigoberto Acifuina. All rights reserved.
//

import UIKit
import Parse


class LoginVC: UIViewController {
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var nombrePadreLabel: UITextField!
    @IBOutlet weak var nombreAlumnoLabel: UITextField!
    @IBOutlet weak var gradoSelector: UISegmentedControl!
    @IBOutlet weak var seccionSelector: UISegmentedControl!
    @IBOutlet weak var entrarButton: UIButton!
    @IBOutlet weak var seccionTitleLabel: UILabel!
    @IBOutlet weak var atrasNavButton: UIBarButtonItem!
    var gradoSeccionprimerHijo = ""
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func gradoSelected(sender: UISegmentedControl) {
        switch gradoSelector.selectedSegmentIndex {
        case 0:
            seccionTitleLabel.hidden = false
            seccionSelector.hidden = false
            break
        case 1:
            seccionTitleLabel.hidden = false
            seccionSelector.hidden = false
            break
        case 2:
            seccionTitleLabel.hidden = false
            seccionSelector.hidden = false
            break
        case 3:
            entrarButton.hidden = false
            seccionTitleLabel.hidden = true
            seccionSelector.hidden = true
            gradoSeccionprimerHijo = "prekinder3"
        default:
            print("no selection made")
            break
        }
    }
    
    
    @IBAction func seccionSelected(sender: UISegmentedControl) {
        if gradoSelector.selectedSegmentIndex == 0 && seccionSelector.selectedSegmentIndex == 0 {
            gradoSeccionprimerHijo = "maternala"
            entrarButton.hidden = false
        } else if gradoSelector.selectedSegmentIndex == 0 && seccionSelector.selectedSegmentIndex == 1 {
            gradoSeccionprimerHijo =  "maternalb"
            entrarButton.hidden = false
        } else if gradoSelector.selectedSegmentIndex == 1 && seccionSelector.selectedSegmentIndex == 0 {
            gradoSeccionprimerHijo = "prekinder1a"
            entrarButton.hidden = false
        } else if gradoSelector.selectedSegmentIndex == 1 && seccionSelector.selectedSegmentIndex == 1 {
            gradoSeccionprimerHijo = "prekinder1b"
            entrarButton.hidden = false
        } else if gradoSelector.selectedSegmentIndex == 2 && seccionSelector.selectedSegmentIndex == 0 {
            gradoSeccionprimerHijo = "prekinder2a"
            entrarButton.hidden = false
        } else if gradoSelector.selectedSegmentIndex == 2 && seccionSelector.selectedSegmentIndex == 1 {
            gradoSeccionprimerHijo = "prekinder2b"
            entrarButton.hidden = false
        }
    }
    

    @IBAction func entrarButtonPressed(sender: AnyObject) {
        registrarUsuarios()
    }
    
    func registrarUsuarios() {
        let user = PFUser()
        user.username = emailTextField.text
        user.password = passwordTextField.text
        // other fields can be set just like with PFObject
        user["hijo1"] =  nombreAlumnoLabel.text
        user["nombrePapa"] = nombrePadreLabel.text
        user["seccion1"] = gradoSeccionprimerHijo
        user.signUpInBackgroundWithBlock {
            (succeeded: Bool, error: NSError?) -> Void in
            if let error = error {
                let errorString = error.userInfo["error"] as? NSString
                // Show the errorString somewhere and let the user try again.
                print(errorString)
            } else {
                // Hooray! Let them use the app now.
                print("Usuario Creado")
                usuario = PFUser.currentUser()
                SECCIONACTUAL = usuario!["seccion1"] as! String
                
                self.dismissViewControllerAnimated(true, completion: nil)
            }
        }
    }

    @IBAction func atrasButtonPressed(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
   

    
}
