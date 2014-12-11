//
//  managedItems.swift
//  UploadingParseDataToTables
//
//  Created by Creighton Taylor on 12/10/14.
//  Copyright (c) 2014 iClair. All rights reserved.
//

import UIKit

class managedItems: UIViewController, UITableViewDataSource, UITableViewDelegate{

    var itemTitles = [String]()
    var itemCategories = [String]()
    //var peopleAdoptedText = [String]()
    var userPurposeItems = [String]()
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        var Query = PFQuery(className: "myPurposeItems")
        Query.whereKey("userID", equalTo: PFUser.currentUser().username)
        Query.findObjectsInBackgroundWithBlock{
            (objects: [AnyObject]!, error: NSError!) -> Void in
            if error == nil {
                var myPurposeItems = PFObject(className: "myPurposeItems")
                for object in objects {
                    
                    self.userPurposeItems.append(object["purposeItemID"] as String)
                    var purposeItemID = myPurposeItems["purposeItemID"] as String
                    
                    var DetailsQuery = PFQuery(className:"purposeItems")
                    DetailsQuery.getObjectInBackgroundWithId(purposeItemID) {
                        (purposeItems: PFObject!, error: NSError!) -> Void in
                        if error == nil {
                            
                            self.itemTitles.append(object["text"] as String)
                            self.itemCategories.append(object["category"] as String)
                            
                            self.tableView.reloadData()
                            println("success!")
                            
                        } else {
                            
                            println("error")
                            
                        }
                    }
                }
            
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemTitles.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var myCell:cell? = self.tableView.dequeueReusableCellWithIdentifier("myCell") as? cell
        myCell!.itemTitle.text = itemTitles[indexPath.row]
        myCell!.itemCategory.text = itemCategories[indexPath.row]
        //myCell!.peopleAdopted.text = peopleAdoptedText[indexPath.row]
        return myCell!
        
    }


}
