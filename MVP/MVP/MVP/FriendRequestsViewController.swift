//
//  FriendRequestsViewController.swift
//  MVP
//
//  Created by Creighton Taylor on 12/7/14.
//  Copyright (c) 2014 iClair. All rights reserved.
//

import UIKit

class FriendRequestsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var outstandingRequests = [""]
    var requestDecision = Bool()
    
    @IBAction func acceptFriendRequest(sender: AnyObject) {
        requestDecision = true
    }
    @IBAction func rejectFriendRequest(sender: AnyObject) {
        
        requestDecision = false
    }


    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        println(PFUser.currentUser())
        
        var query = PFUser.query()
        
        query.findObjectsInBackgroundWithBlock({ (objects: [AnyObject]!, error: NSError!) -> Void in
            
            self.outstandingRequests.removeAll(keepCapacity: true)
            
            for object in objects {
                
                var user:PFUser = object as PFUser
            
                var query = PFQuery(className:"friendRequest")
                query.whereKey("requestee", equalTo:PFUser.currentUser().username)
                query.whereKey("requester", equalTo:user.username)
                query.findObjectsInBackgroundWithBlock {
                    (objects: [AnyObject]!, error: NSError!) -> Void in
                    if error == nil {
                
                    if user.username != PFUser.currentUser().username {
                            
                        for object in objects {
                                
                            self.outstandingRequests.append(user.username)
                            
                        }
                            
                        self.tableView.reloadData()
                            
                    } else {
                        println(error)
                    }
                        
                    
                }
                }
            }
        })
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return outstandingRequests.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell:UITableViewCell = tableView.dequeueReusableCellWithIdentifier("cell") as UITableViewCell
        
        cell.textLabel?.text = outstandingRequests[indexPath.row]
        
        return cell
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        
        var cell:UITableViewCell = tableView.cellForRowAtIndexPath(indexPath)!
        
        if cell.accessoryType == UITableViewCellAccessoryType.Checkmark {
            
            cell.accessoryType = UITableViewCellAccessoryType.None
            
            var query = PFQuery(className:"friendRequest")
            query.whereKey("requester", equalTo:PFUser.currentUser().username)
            query.whereKey("requestee", equalTo:cell.textLabel?.text)
            query.findObjectsInBackgroundWithBlock {
                (objects: [AnyObject]!, error: NSError!) -> Void in
                if error == nil {
                    
                    for object in objects {
                        
                        object.deleteInBackground()
                        
                    }
                } else {
                    println(error)
                }
            }
            
        } else {
            
            cell.accessoryType = UITableViewCellAccessoryType.Checkmark
            
            var friendRequest = PFObject(className: "friendRequest")
            friendRequest["requestee"] = PFUser.currentUser().username
            friendRequest["requester"] = cell.textLabel?.text
            friendRequest.saveinBackground()
            
        }
        
    }
}
