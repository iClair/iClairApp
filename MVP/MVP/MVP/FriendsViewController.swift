//
//  FriendsViewController.swift
//  MVP
//
//  Created by Creighton Taylor on 12/5/14.
//  Copyright (c) 2014 iClair. All rights reserved.
//

import UIKit

class FriendsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    var users = [""]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var query = PFUser.query()
        query.findObjectsInBackgroundWithBlock({ (objects: [AnyObject]!, error: NSError!) -> Void in
            
            self.users.removeAll(keepCapacity: true)
            
            for object in objects{
                var user:PFUser = object as PFUser
                
                if user.username != PFUser.currentUser().username{
                
                    self.users.append(user.username)
                }
            }
            
            /* for some reason xcode isn't recognizing reload data. Won't show user list.
            self.tableView.reloadData()
            */

        })
        

    }
    


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return users.count
    }

    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
    
        let cell:UITableViewCell = tableView.dequeueReusableCellWithIdentifier("cell") as UITableViewCell
        cell.textLabel?.text = users[indexPath.row]
        return cell
    }


}
