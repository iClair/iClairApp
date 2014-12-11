//
//  FindFriendsViewController.swift
//  MVP
//
//  Created by Creighton Taylor on 12/6/14.
//  Copyright (c) 2014 iClair. All rights reserved.
//

import UIKit

class FindFriendsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var potentialFriends = [""]
    var friendRequest = [Bool]()
    var refresher: UIRefreshControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        println(PFUser.currentUser())
        
        updateUsers()
        
        refresher = UIRefreshControl()
        refresher.attributedTitle = NSAttributedString(string: "Pull to refresh")
        refresher.addTarget(self, action: "refresh", forControlEvents: UIControlEvents.ValueChanged)
        self.tableView.addSubView(refresher)
    }
    
    func updateUsers(){
        
        var query = PFUser.query()
        
        query.findObjectsInBackgroundWithBlock({ (objects: [AnyObject]!, error: NSError!) -> Void in
            
            self.potentialFriends.removeAll(keepCapacity: true)
            
            for object in objects {
                
                var user:PFUser = object as PFUser
                
                var hasRequestedFriendship:Bool
                
                if user.username != PFUser.currentUser().username {
                    
                    self.potentialFriends.append(user.username)
                    
                    hasRequestedFriendship = false
                    
                    var query = PFQuery(className:"friendRequest")
                    query.whereKey("requester", equalTo:PFUser.currentUser().username)
                    query.whereKey("requestee", equalTo:user.username)
                    query.findObjectsInBackgroundWithBlock {
                        (objects: [AnyObject]!, error: NSError!) -> Void in
                        if error == nil {
                            
                            for object in objects {
                                
                                hasRequestedFriendship = true
                            }
                            
                            self.friendRequest.append(hasRequestedFriendship)
                            
                            //self.tableView.reloadData()
                            
                        } else {
                            println(error)
                        }
                        
                        self.refresher.endRefreshing()
                    }
                    
                }
            }
        })
        
        

    }
    
    func refresh(){
        println("refreshed")
        
        updateUsers()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return potentialFriends.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell:UITableViewCell = tableView.dequeueReusableCellWithIdentifier("cell") as UITableViewCell
        
        if friendRequest.count > indexPath.row {
            
            if friendRequest[indexPath.row] == true {
                
                cell.accessoryType = UITableViewCellAccessoryType.Checkmark
                
            }
            
        }
        
        cell.textLabel?.text = potentialFriends[indexPath.row]
        
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
            friendRequest.save()
    
        }
        
    }

}
