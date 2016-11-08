//
//  ListadoEventosVC.swift
//  Gan Hillel
//
//  Created by Rigoberto Acifuina on 2/11/15.
//  Copyright © 2015 Rigoberto Acifuina. All rights reserved.
//

import UIKit
import Parse
import ParseUI

class ListadoEventosVC : PFQueryTableViewController {
    
   
    
    override init(style: UITableViewStyle, className: String?) {
        super.init(style: style, className: className)
        parseClassName = "Eventos"
        pullToRefreshEnabled = true
        paginationEnabled = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        parseClassName = "Eventos"
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
        
        query.orderByDescending("fecha")
        
        return query
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath, object: PFObject?) -> PFTableViewCell? {
        let cellIdentifier = "cell"
        
        var cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as? PFTableViewCell
        if cell == nil {
            cell = PFTableViewCell(style: .Subtitle, reuseIdentifier: cellIdentifier)
        }
        
        // Configure the cell to show todo item with a priority at the bottom
        if let object = object {
            cell!.textLabel?.text = object["titulo"] as? String
            let priority = object["info"]
            cell!.detailTextLabel?.text = "\(priority)"
        }
        
        return cell
    }
   
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let destinationVC = segue.destinationViewController as! EventoVC
        let cell = sender as! PFTableViewCell
        destinationVC.navigationItem.title = cell.textLabel!.text
        destinationVC.tituloVista = cell.textLabel!.text!
    }
    
    
    
    
}