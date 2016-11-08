//
//  EventoVC.swift
//  Gan Hillel
//
//  Created by Rigoberto Acifuina on 2/11/15.
//  Copyright © 2015 Rigoberto Acifuina. All rights reserved.
//

import UIKit
import Parse


class EventoVC: UIViewController {
    
    

    @IBOutlet weak var imagenEvento: UIImageView!
    @IBOutlet weak var tituloEventoLabel: UILabel!
    @IBOutlet weak var fechaEventoLabel: UILabel!
    @IBOutlet weak var direccionEventoLabel: UILabel!
    @IBOutlet weak var descripcionEventoText: UITextView!
    var tituloVista = ""
    var urlImagen = ""
    var imageCache = NSMutableDictionary()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        queryPorEvento()
    }

    func queryPorEvento () {
        let query = PFQuery(className:"Eventos")
        query.whereKey("titulo", equalTo: tituloVista)
        query.findObjectsInBackgroundWithBlock {
            (objects: [PFObject]?, error: NSError?) -> Void in
            
            if error == nil {
                // Do something with the found objects
                if let objects = objects {
                    for object in objects {
                        self.tituloEventoLabel.text = object["titulo"] as? String
                        self.fechaEventoLabel.text = object["fechaString"] as? String
                        self.descripcionEventoText.text = object["infoCompleta"] as! String
                        self.direccionEventoLabel.text = object["locacion"] as? String
                        //self.urlImagen = object["imagen"] as! String
                        let userImageFile = object["imagenEvento"] as! PFFile
                        userImageFile.getDataInBackgroundWithBlock {
                            (imageData: NSData?, error: NSError?) -> Void in
                            if error == nil {
                                if let imageData = imageData {
                                    let image = UIImage(data:imageData)
                                    if let calendario = image {
                                        self.imagenEvento.image = calendario
                                    }
                                }
                            }
                        }
                    }
                }
            } else {
                print("Error: \(error!) \(error!.userInfo)")
            }
        }
        
    }
    
    
    
}
