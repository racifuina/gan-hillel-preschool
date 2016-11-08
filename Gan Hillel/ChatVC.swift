//
//  ChatVC.swift
//  Gan Hillel
//
//  Created by Rigoberto Acifuina on 2/11/15.
//  Copyright © 2015 Rigoberto Acifuina. All rights reserved.
//

import UIKit
import JSQMessagesViewController
import Parse

class ChatVC: JSQMessagesViewController {
    
    var isRunning = false
    let incomingBubble = JSQMessagesBubbleImageFactory().incomingMessagesBubbleImageWithColor(UIColor.lightGrayColor())
    let outgoingBubble = JSQMessagesBubbleImageFactory().outgoingMessagesBubbleImageWithColor(UIColor(red: 57/255, green: 143/255, blue: 209/255, alpha: 1.0))
    var messages = [JSQMessage]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView?.collectionViewLayout.incomingAvatarViewSize = CGSizeZero
        self.collectionView?.collectionViewLayout.outgoingAvatarViewSize = CGSizeZero
        self.inputToolbar?.contentView?.leftBarButtonItem = nil
        self.setup()
        self.downloadMessagesFromParse()
        scrollToBottomAnimated(false)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "addPushMessage", name: "getMessage", object: nil)
    }
  
    override func viewDidAppear(animated: Bool) {
        isRunning = true
        if isRunning {
            NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "addPushMessage", userInfo: nil, repeats: true)
        }
    }
    
    override func viewWillDisappear(animated: Bool) {
        isRunning = false
    }
    
    func setup() {
        let currentUser = PFUser.currentUser()
        self.senderId = currentUser?.objectId
        self.senderDisplayName = currentUser!["nombrePapa"] as! String
    }
    
    func reloadMessagesView() {
        self.collectionView?.reloadData()
    }
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.messages.count
    }

    override func collectionView(collectionView: JSQMessagesCollectionView!, messageDataForItemAtIndexPath indexPath: NSIndexPath!) -> JSQMessageData! {
        let data = self.messages[indexPath.row]
        return data
    }

    override func collectionView(collectionView: JSQMessagesCollectionView!, didDeleteMessageAtIndexPath indexPath: NSIndexPath!) {
        self.messages.removeAtIndex(indexPath.row)
    }

    override func collectionView(collectionView: JSQMessagesCollectionView!, messageBubbleImageDataForItemAtIndexPath indexPath: NSIndexPath!) -> JSQMessageBubbleImageDataSource! {
        let data = messages[indexPath.row]
        switch(data.senderId) {
        case self.senderId:
            return self.outgoingBubble
        default:
            return self.incomingBubble
        }
    }

    
    override func collectionView(collectionView: JSQMessagesCollectionView!, avatarImageDataForItemAtIndexPath indexPath: NSIndexPath!) -> JSQMessageAvatarImageDataSource! {
        return nil
    }
    
   
    // View  usernames above bubbles
    override func collectionView(collectionView: JSQMessagesCollectionView!, attributedTextForMessageBubbleTopLabelAtIndexPath indexPath: NSIndexPath!) -> NSAttributedString! {
        let message = messages[indexPath.item];
        
//        // Sent by me, skip
//        if message.senderDisplayName == senderDisplayName {
//            return nil;
//        }
        
        // Same as previous sender, skip
        if indexPath.item > 0 {
            let previousMessage = messages[indexPath.item - 1];
            if previousMessage.senderDisplayName == message.senderDisplayName {
                return nil;
            }
        }
        
        return NSAttributedString(string:message.senderDisplayName)
    }
    
    override func collectionView(collectionView: JSQMessagesCollectionView!, layout collectionViewLayout: JSQMessagesCollectionViewFlowLayout!, heightForMessageBubbleTopLabelAtIndexPath indexPath: NSIndexPath!) -> CGFloat {
        let message = messages[indexPath.item]
        
//        // Sent by me, skip
//        if message.senderDisplayName == senderDisplayName {
//            return CGFloat(0.0);
//        }
        
        // Same as previous sender, skip
        if indexPath.item > 0 {
            let previousMessage = messages[indexPath.item - 1];
            if previousMessage.senderDisplayName == message.senderDisplayName {
                return CGFloat(0.0);
            }
        }
        
        return kJSQMessagesCollectionViewCellLabelHeightDefault
    }



    
    override func didPressSendButton(button: UIButton!, withMessageText text: String!, senderId: String!, senderDisplayName: String!, date: NSDate!) {
        let message = JSQMessage(senderId: senderId, senderDisplayName: senderDisplayName, date: date, text: text)
        self.messages += [message]
        self.finishSendingMessage()
        sendMessageToParse(message)
    }

    override func didPressAccessoryButton(sender: UIButton!) {
    }
    
    // MARK - adding Parse
    
    func sendMessageToParse (message: JSQMessage) {
        let messageToSend = PFObject(className: SECCIONACTUAL)
        messageToSend["message"] = message.text
        messageToSend["senderID"] = self.senderId
        messageToSend["nombreCompleto"] = self.senderDisplayName
        messageToSend.saveInBackgroundWithBlock {
            (success: Bool, error: NSError?) -> Void in
            if (success) {
                // The object has been saved.
                
                
                let data = [
                    "message":message.text,
                    "senderID":self.senderId,
                    "nombreCompleto": self.senderDisplayName
                ]
                
                let push = PFPush()
                push.setData(data)
                push.setChannel(SECCIONACTUAL)
                push.sendPushInBackground()
            } else {
                // There was a problem, check error.description
            }
        }
    }
    
    func downloadMessagesFromParse (){
        let query = PFQuery(className: SECCIONACTUAL)
        query.orderByAscending("createdAt")
        query.findObjectsInBackgroundWithBlock {
            (objects: [PFObject]?, error: NSError?) -> Void in
            if error == nil {
                if let objects = objects {
                    for object in objects {
                        let newMessage = JSQMessage(senderId: object["senderID"] as! String!, displayName: object["nombreCompleto"] as! String!, text: object["message"] as! String!)
                        self.messages += [newMessage]
                        self.reloadMessagesView()
                        let item = self.collectionView(self.collectionView!, numberOfItemsInSection: 0) - 1
                        let lastItemIndex = NSIndexPath(forItem: item, inSection: 0)
                        self.collectionView?.scrollToItemAtIndexPath(lastItemIndex, atScrollPosition: UICollectionViewScrollPosition.Top, animated: false)
                    }
                }
            } else {
                // Log details of the failure
                print("Error: \(error!) \(error!.userInfo)")
            }
        }
    }
    
    func newMessage () {
    
        downloadMessagesFromParse()
    }
    
    func addPushMessage() {
        messages.removeAll()
        let query = PFQuery(className: SECCIONACTUAL)
        query.orderByAscending("createdAt")
        query.findObjectsInBackgroundWithBlock {
            (objects: [PFObject]?, error: NSError?) -> Void in
            if error == nil {
                if let objects = objects {
                    for object in objects {
                        let newMessage = JSQMessage(senderId: object["senderID"] as! String!, displayName: object["nombreCompleto"] as! String!, text: object["message"] as! String!)
                        self.messages += [newMessage]
                        self.reloadMessagesView()
                        let item = self.collectionView(self.collectionView!, numberOfItemsInSection: 0) - 1
                        let lastItemIndex = NSIndexPath(forItem: item, inSection: 0)
                        self.collectionView?.scrollToItemAtIndexPath(lastItemIndex, atScrollPosition: UICollectionViewScrollPosition.Top, animated: false)
                    }
                }
            } else {
                // Log details of the failure
                print("Error: \(error!) \(error!.userInfo)")
            }
        }

    }

    

    
}
