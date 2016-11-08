//
//  AvisosVC.swift
//  Gan Hillel
//
//  Created by Rigoberto Acifuina on 11/11/15.
//  Copyright © 2015 Rigoberto Acifuina. All rights reserved.
//

import UIKit
import Parse
import ParseUI

class AvisosVC : PFQueryTableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override init(style: UITableViewStyle, className: String?) {
        super.init(style: style, className: className)
        parseClassName = "Avisos"
        pullToRefreshEnabled = true
        paginationEnabled = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        parseClassName = "Avisos"
        pullToRefreshEnabled = true
        paginationEnabled = false
    }
    
    override func queryForTable() -> PFQuery {
        let query = PFQuery(className: self.parseClassName!)
        
        // If no objects are loaded in memory, we look to the cache first to fill the table
        // and then subsequently do a query against the network.
        if self.objects!.count == 0 {
            query.cachePolicy = .CacheThenNetwork
        }
        
        
        let nombreUsuario = PFUser.currentUser()!.objectId! as String
        let names = ["todos", nombreUsuario, SECCIONACTUAL]
        query.whereKey("user", containedIn: names)
        query.orderByDescending("createdAt")
        
        return query
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath, object: PFObject?) -> PFTableViewCell? {
        let cellIdentifier = "avisoCell"
        
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as? CustomAvisoCell
        
        // Configure the cell to show todo item with a priority at the bottom
        if let object = object {
            cell!.tituloLabel.text = object["tituloAviso"] as? String
            let priority = object["infoAviso"]
            cell!.infoText.text = "\(priority)"
        }
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    

}
