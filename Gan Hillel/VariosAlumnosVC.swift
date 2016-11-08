//
//  VariosAlumnosVC.swift
//  Gan Hillel
//
//  Created by Rigoberto Acifuina on 19/11/15.
//  Copyright © 2015 Rigoberto Acifuina. All rights reserved.
//

import UIKit
import Parse

class VariosAlumnosVC: UIViewController {
    
    
    //INFO PAPA
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var contraseñaTextField: UITextField!
    @IBOutlet weak var nombrePadreTextField: UITextField!
    @IBOutlet weak var scrollView: UIScrollView!
    //PRIMER HIJO
    @IBOutlet weak var primerHijoNombreTextField: UITextField!
    @IBOutlet weak var primerHijoGrado: UISegmentedControl!
    @IBOutlet weak var primerHijoSeccion: UISegmentedControl!
    @IBOutlet weak var primerHijoSeccionTitle: UILabel!
    var gradoSeccionprimerHijo = ""
    //SEGUNDO HIJO
    @IBOutlet weak var segundoHijoNombre: UITextField!
    @IBOutlet weak var segundoHijoGrado: UISegmentedControl!
    @IBOutlet weak var segundoHijoSeccion: UISegmentedControl!
    @IBOutlet weak var segundoHijoSeccionTitle: UILabel!
    var gradoSeccionSegundoHijo = ""
    //TERCER HIJO
    @IBOutlet weak var tercerHijoNombre: UITextField!
    @IBOutlet weak var tercerHijoGrado: UISegmentedControl!
    @IBOutlet weak var tercerHijoSeccion: UISegmentedControl!
    @IBOutlet weak var tercerHijoSeccionTitle: UILabel!
    var gradoSeccionTercerHijo = ""
    //CUARTO HIJO
    @IBOutlet weak var cuartoHijoNombre: UITextField!
    @IBOutlet weak var cuartoHijoGrado: UISegmentedControl!
    @IBOutlet weak var cuartoHijoSeccion: UISegmentedControl!
    @IBOutlet weak var cuartoHijoSeccionTitle: UILabel!
    var gradoSeccionCuartoHijo = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.contentSize.height = 1000
        
    }
    
    // MARK - PRIMER HIJO
    @IBAction func primerHijoGradoSelected(sender: AnyObject) {
        switch primerHijoGrado.selectedSegmentIndex {
        case 0:
            primerHijoSeccion.hidden = false
            primerHijoSeccionTitle.hidden = false
            break
        case 1:
            primerHijoSeccion.hidden = false
            primerHijoSeccionTitle.hidden = false
            break
        case 2:
            primerHijoSeccion.hidden = false
            primerHijoSeccionTitle.hidden = false
            break
        case 3:
            primerHijoSeccion.hidden = true
            primerHijoSeccionTitle.hidden = true
            gradoSeccionprimerHijo = "prekinder3"
            print(gradoSeccionprimerHijo)
            break
        default:
            print("no selection made")
            break
        }
    }
    
    @IBAction func primerHijoSeccionSelected(sender: AnyObject) {
       
        if primerHijoGrado.selectedSegmentIndex == 0 && primerHijoSeccion.selectedSegmentIndex == 0 {
            gradoSeccionprimerHijo = "maternala"
            print(gradoSeccionprimerHijo)
        } else if primerHijoGrado.selectedSegmentIndex == 0 && primerHijoSeccion.selectedSegmentIndex == 1 {
            gradoSeccionprimerHijo = "maternalb"
            print(gradoSeccionprimerHijo)
        } else if primerHijoGrado.selectedSegmentIndex == 1 && primerHijoSeccion.selectedSegmentIndex == 0 {
            gradoSeccionprimerHijo = "prekinder1a"
            print(gradoSeccionprimerHijo)
        } else if primerHijoGrado.selectedSegmentIndex == 1 && primerHijoSeccion.selectedSegmentIndex == 1 {
            gradoSeccionprimerHijo = "prekinder1b"
            print(gradoSeccionprimerHijo)
        } else if primerHijoGrado.selectedSegmentIndex == 2 && primerHijoSeccion.selectedSegmentIndex == 0 {
            gradoSeccionprimerHijo = "prekinder2a"
            print(gradoSeccionprimerHijo)
        } else if primerHijoGrado.selectedSegmentIndex == 2 && primerHijoSeccion.selectedSegmentIndex == 1 {
            gradoSeccionprimerHijo = "prekinder2b"
            print(gradoSeccionprimerHijo)
        }
        
    }
    
    // MARK - SEGUNDO HIJO
    
    @IBAction func segundoHijoGradoSelected(sender: AnyObject) {
        switch segundoHijoGrado.selectedSegmentIndex {
        case 0:
            segundoHijoSeccion.hidden = false
            segundoHijoSeccionTitle.hidden = false
            break
        case 1:
            segundoHijoSeccion.hidden = false
            segundoHijoSeccionTitle.hidden = false
            break
        case 2:
            segundoHijoSeccion.hidden = false
            segundoHijoSeccionTitle.hidden = false
            break
        case 3:
            segundoHijoSeccion.hidden = true
            segundoHijoSeccionTitle.hidden = true
            gradoSeccionSegundoHijo = "prekinder3"
            print(gradoSeccionSegundoHijo)
            break
        default:
            print("no selection made")
            break
        }
    }
    
    @IBAction func segundoHijoSeccionSelected(sender: AnyObject) {
        if segundoHijoGrado.selectedSegmentIndex == 0 && segundoHijoSeccion.selectedSegmentIndex == 0 {
            gradoSeccionSegundoHijo = "maternala"
            print(gradoSeccionSegundoHijo)
        } else if segundoHijoGrado.selectedSegmentIndex == 0 && segundoHijoSeccion.selectedSegmentIndex == 1 {
            gradoSeccionSegundoHijo = "maternalb"
            print(gradoSeccionSegundoHijo)
        } else if segundoHijoGrado.selectedSegmentIndex == 1 && segundoHijoSeccion.selectedSegmentIndex == 0 {
            gradoSeccionSegundoHijo = "prekinder1a"
            print(gradoSeccionSegundoHijo)
        } else if segundoHijoGrado.selectedSegmentIndex == 1 && segundoHijoSeccion.selectedSegmentIndex == 1 {
            gradoSeccionSegundoHijo = "prekinder1b"
            print(gradoSeccionSegundoHijo)
        } else if segundoHijoGrado.selectedSegmentIndex == 2 && segundoHijoSeccion.selectedSegmentIndex == 0 {
            gradoSeccionSegundoHijo = "prekinder2a"
            print(gradoSeccionSegundoHijo)
        } else if segundoHijoGrado.selectedSegmentIndex == 2 && segundoHijoSeccion.selectedSegmentIndex == 1 {
            gradoSeccionSegundoHijo = "prekinder2b"
            print(gradoSeccionSegundoHijo)
        }
        
    }
    
    // MARK - TERCER HIJO
    
    @IBAction func tercerHijoGradoSelected(sender: AnyObject) {
        switch tercerHijoGrado.selectedSegmentIndex {
        case 0:
            tercerHijoSeccion.hidden = false
            tercerHijoSeccionTitle.hidden = false
            break
        case 1:
            tercerHijoSeccion.hidden = false
            tercerHijoSeccionTitle.hidden = false
            break
        case 2:
            tercerHijoSeccion.hidden = false
            tercerHijoSeccionTitle.hidden = false
            break
        case 3:
            tercerHijoSeccion.hidden = true
            tercerHijoSeccionTitle.hidden = true
            gradoSeccionTercerHijo = "prekinder3"
            print(gradoSeccionTercerHijo)
            break
        default:
            print("no selection made")
            break
        }
    }
    
    
    @IBAction func tercerHijoSeccionSelected(sender: AnyObject) {
        if tercerHijoGrado.selectedSegmentIndex == 0 && tercerHijoSeccion.selectedSegmentIndex == 0 {
            gradoSeccionTercerHijo = "maternala"
            print(gradoSeccionTercerHijo)
        } else if tercerHijoGrado.selectedSegmentIndex == 0 && tercerHijoSeccion.selectedSegmentIndex == 1 {
            gradoSeccionTercerHijo = "maternalb"
            print(gradoSeccionTercerHijo)
        } else if tercerHijoGrado.selectedSegmentIndex == 1 && tercerHijoSeccion.selectedSegmentIndex == 0 {
            gradoSeccionTercerHijo = "prekinder1a"
            print(gradoSeccionTercerHijo)
        } else if tercerHijoGrado.selectedSegmentIndex == 1 && tercerHijoSeccion.selectedSegmentIndex == 1 {
            gradoSeccionTercerHijo = "prekinder1b"
            print(gradoSeccionTercerHijo)
        } else if tercerHijoGrado.selectedSegmentIndex == 2 && tercerHijoSeccion.selectedSegmentIndex == 0 {
            gradoSeccionTercerHijo = "prekinder2a"
            print(gradoSeccionTercerHijo)
        } else if tercerHijoGrado.selectedSegmentIndex == 2 && tercerHijoSeccion.selectedSegmentIndex == 1 {
            gradoSeccionTercerHijo = "prekinder2b"
            print(gradoSeccionTercerHijo)
        }
    }
    
    //MARK - CUARTO HIJO
    
    @IBAction func cuartoHijoGradoSelected(sender: AnyObject) {
        switch cuartoHijoGrado.selectedSegmentIndex {
        case 0:
            cuartoHijoSeccion.hidden = false
            cuartoHijoSeccionTitle.hidden = false
            break
        case 1:
            cuartoHijoSeccion.hidden = false
            cuartoHijoSeccionTitle.hidden = false
            break
        case 2:
            cuartoHijoSeccion.hidden = false
            cuartoHijoSeccionTitle.hidden = false
            break
        case 3:
            cuartoHijoSeccion.hidden = true
            cuartoHijoSeccionTitle.hidden = true
            gradoSeccionCuartoHijo = "prekinder3"
            print(gradoSeccionCuartoHijo)
            break
        default:
            print("no selection made")
            break
        }
    }
    
    
    @IBAction func cuartoHijoSeccionSelected(sender: AnyObject) {
        if cuartoHijoGrado.selectedSegmentIndex == 0 && cuartoHijoSeccion.selectedSegmentIndex == 0 {
            gradoSeccionCuartoHijo = "maternala"
            print(gradoSeccionCuartoHijo)
        } else if cuartoHijoGrado.selectedSegmentIndex == 0 && cuartoHijoSeccion.selectedSegmentIndex == 1 {
            gradoSeccionCuartoHijo = "maternalb"
            print(gradoSeccionCuartoHijo)
        } else if cuartoHijoGrado.selectedSegmentIndex == 1 && cuartoHijoSeccion.selectedSegmentIndex == 0 {
            gradoSeccionCuartoHijo = "prekinder1a"
            print(gradoSeccionCuartoHijo)
        } else if cuartoHijoGrado.selectedSegmentIndex == 1 && cuartoHijoSeccion.selectedSegmentIndex == 1 {
            gradoSeccionCuartoHijo = "prekinder1b"
            print(gradoSeccionCuartoHijo)
        } else if cuartoHijoGrado.selectedSegmentIndex == 2 && cuartoHijoSeccion.selectedSegmentIndex == 0 {
            gradoSeccionCuartoHijo = "prekinder2a"
            print(gradoSeccionCuartoHijo)
        } else if cuartoHijoGrado.selectedSegmentIndex == 2 && cuartoHijoSeccion.selectedSegmentIndex == 1 {
            gradoSeccionCuartoHijo = "prekinder2b"
            print(gradoSeccionCuartoHijo)
        }
    }
    
    
    
    
    
    // MARK - SIGN UP TO PARSE
    
    @IBAction func listoButtonPressed(sender: AnyObject) {
        let user = PFUser()
        user.username = emailTextField.text
        user.password = contraseñaTextField.text
        // other fields can be set just like with PFObject
        user["nombrePapa"] = nombrePadreTextField.text
        user["hijo1"] = primerHijoNombreTextField.text
        user["hijo2"] = segundoHijoNombre.text
        user["hijo3"] = tercerHijoNombre.text
        user["hijo4"] = cuartoHijoNombre.text
        user["seccion1"] = gradoSeccionprimerHijo
        user["seccion2"] = gradoSeccionSegundoHijo
        user["seccion3"] = gradoSeccionTercerHijo
        user["seccion4"] = gradoSeccionCuartoHijo
        
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
