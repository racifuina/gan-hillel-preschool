//
//  PerfilVC.swift
//  Gan Hillel
//
//  Created by Rigoberto Acifuina on 19/11/15.
//  Copyright © 2015 Rigoberto Acifuina. All rights reserved.
//

import UIKit
import Parse

class PerfilVC: UIViewController {

    
    @IBOutlet weak var nombrePadreLabel: UILabel!
    @IBOutlet weak var codigoLabel: UILabel!
    
    @IBOutlet weak var PrimerHijoNombre: UILabel!
    @IBOutlet weak var primerHijoGrado: UILabel!
    @IBOutlet weak var primerHijoButton: UIButton!
    
    @IBOutlet weak var segundoHijoNombre: UILabel!
    @IBOutlet weak var segundoHijoGrado: UILabel!
    @IBOutlet weak var segundoHijoButton: UIButton!

    @IBOutlet weak var tercerHijoNombre: UILabel!
    @IBOutlet weak var tercerHijoGrado: UILabel!
    @IBOutlet weak var tercerHijoButton: UIButton!
    
    @IBOutlet weak var cuartoHijoNombre: UILabel!
    @IBOutlet weak var cuartoHijoGrado: UILabel!
    @IBOutlet weak var cuartoHijoButton: UIButton!
    
    
    //FONDO
    
    
    
    @IBOutlet weak var fondoBlanco: UIView!
    
    @IBOutlet weak var fondogris1: UIView!
    
    @IBOutlet weak var fondogris2: UIView!
    
    @IBOutlet weak var fondogris3: UIView!
    
    @IBOutlet weak var fondogris4: UIView!
    
    
    
    override func viewDidLoad() {
        fondoBlanco.layer.cornerRadius = 10
        fondogris1.layer.cornerRadius = 10
        fondogris2.layer.cornerRadius = 10
        fondogris3.layer.cornerRadius = 10
        fondogris4.layer.cornerRadius = 10
    }
    
    override func viewWillAppear(animated: Bool) {
        
        if let papa = PFUser.currentUser()!["nombrePapa"] as? String {
            nombrePadreLabel.text = papa
        }
        
        if let codigo = usuario!["correlativo"] as? String {
            codigoLabel.text = codigo
            let currentInstallation = PFInstallation.currentInstallation()
            currentInstallation.addUniqueObject("c\(codigo)", forKey: "channels")
            currentInstallation.saveInBackground()
        }
        
        if let nombre1 = usuario!["hijo1"] as? String {
            PrimerHijoNombre.text = nombre1
        }
        
        if let seccion1 = usuario!["seccion1"] as? String {
            primerHijoGrado.text = seccion1
            let currentInstallation = PFInstallation.currentInstallation()
            currentInstallation.addUniqueObject(seccion1, forKey: "channels")
            currentInstallation.saveInBackground()
        }
        
        if let nombre2 = usuario!["hijo2"] as? String {
            segundoHijoNombre.text = nombre2
            segundoHijoButton.hidden = false
        } else {
            segundoHijoButton.hidden = true
        }
        
        if let seccion2 = usuario!["seccion2"] as? String {
            segundoHijoGrado.text = seccion2
            let currentInstallation = PFInstallation.currentInstallation()
            currentInstallation.addUniqueObject(seccion2, forKey: "channels")
            currentInstallation.saveInBackground()
        }
        
        if let nombre3 = usuario!["hijo3"] as? String{
            tercerHijoNombre.text = nombre3
            tercerHijoButton.hidden = false
        } else {
            tercerHijoButton.hidden = true
        }
        
        if let seccion3 = usuario!["seccion3"] as? String {
            tercerHijoGrado.text = seccion3
            let currentInstallation = PFInstallation.currentInstallation()
            currentInstallation.addUniqueObject(seccion3, forKey: "channels")
            currentInstallation.saveInBackground()
        }
        
        if let nombre4 = usuario!["hijo4"] as? String {
            cuartoHijoNombre.text = nombre4
            cuartoHijoButton.hidden = false
        } else {
            cuartoHijoButton.hidden = true
        }
        
        if let seccion4 = usuario!["seccion4"] as? String {
            cuartoHijoGrado.text =  seccion4
            let currentInstallation = PFInstallation.currentInstallation()
            currentInstallation.addUniqueObject(seccion4, forKey: "channels")
            currentInstallation.saveInBackground()
        }

    }
    
    
    @IBAction func cerrarSesionButtonPressed(sender: AnyObject) {
        PFUser.logOut()
        usuario = nil
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewControllerWithIdentifier("LoginViewController") as! Inicio
        self.presentViewController(vc, animated: true, completion: nil)
        
    }
    
    
    @IBAction func perfilUnoButtonPressed(sender: AnyObject) {
        SECCIONACTUAL = usuario!["seccion1"] as! String
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    
    @IBAction func perfilDosButtonPressed(sender: AnyObject) {
        SECCIONACTUAL = usuario!["seccion2"] as! String
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    @IBAction func perfilTresButtonPressed(sender: AnyObject) {
        SECCIONACTUAL = usuario!["seccion3"] as! String
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    @IBAction func perfilCuatroButtonPressed(sender: AnyObject) {
        SECCIONACTUAL = usuario!["seccion4"] as! String
        self.navigationController?.popViewControllerAnimated(true)
    }
    
}
