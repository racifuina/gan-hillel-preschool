//
//  CustomAvisoCell.swift
//  Gan Hillel
//
//  Created by Rigoberto Acifuina on 11/11/15.
//  Copyright © 2015 Rigoberto Acifuina. All rights reserved.
//

import UIKit
import ParseUI

class CustomAvisoCell: PFTableViewCell {

    @IBOutlet weak var tituloLabel: UILabel!
    @IBOutlet weak var infoText: UITextView!
    @IBOutlet weak var fondo: UIView!
    
    
    override func drawRect(rect: CGRect) {
        fondo.layer.cornerRadius = 10
        infoText.layer.cornerRadius = 10
        
    }

}
