//
//  CalendariosVC.swift
//  Gan Hillel
//
//  Created by Rigoberto Acifuina on 18/11/15.
//  Copyright © 2015 Rigoberto Acifuina. All rights reserved.
//

import UIKit
import Parse
import MWPhotoBrowser
import ParseUI


class CalendariosVC: PFQueryTableViewController, MWPhotoBrowserDelegate {
    var photos = [MWPhoto]()
    var todasLasFotos = [MWPhoto]()
    
    // MARK - Init
    override init(style: UITableViewStyle, className: String?) {
        super.init(style: style, className: className)
        parseClassName = "Calendarios"
        pullToRefreshEnabled = true
        paginationEnabled = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        parseClassName = "Calendarios"
        pullToRefreshEnabled = true
        paginationEnabled = false
    }

    

    // MARK - TableView Query
    
    override func queryForTable() -> PFQuery {
        let query = PFQuery(className: self.parseClassName!)
        query.whereKey("seccion", equalTo: SECCIONACTUAL)
        
        
        // If no objects are loaded in memory, we look to the cache first to fill the table
        // and then subsequently do a query against the network.
        
        if self.objects!.count == 0 {
            query.cachePolicy = .CacheThenNetwork
        }
        
        query.orderByAscending("createdAt")
        return query
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath, object: PFObject?) -> PFTableViewCell? {
        
        let cellIdentifier = "monthCell"
        var cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as? PFTableViewCell
        if cell == nil {
            cell = PFTableViewCell(style: .Subtitle, reuseIdentifier: cellIdentifier)
        }
        // Configure the cell to show todo item with a priority at the bottom
        if let object = object {
            let titulo = object["mes"] as? String
            cell!.textLabel?.text = titulo
            let userImageFile = object["imagen"] as! PFFile
            userImageFile.getDataInBackgroundWithBlock {
                (imageData: NSData?, error: NSError?) -> Void in
                if error == nil {
                    if let imageData = imageData {
                        let image = UIImage(data:imageData)
                        if let calendario = image {
                            cell?.imageView?.image = calendario
                        }
                    }
                }
            }
        }
        return cell
    }
    
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.tableView.deselectRowAtIndexPath(indexPath, animated: true)
        let cell =  self.tableView.cellForRowAtIndexPath(indexPath)
        let image = cell?.imageView?.image
        self.photos.append(MWPhoto(image: image))
        crearBrowser()
    }
    
    
    
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
    

    
    

    
    
}
