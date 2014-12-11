//
//  PurposeItemsDatabase.swift
//  UploadingParseDataToTables
//
//  Created by Creighton Taylor on 12/8/14.
//  Copyright (c) 2014 iClair. All rights reserved.
//

import UIKit

class PurposeItemsDatabase: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var itemTitles = [String]()
    var itemCategories = [String]()
    var peopleAdoptedText = [String]()
    
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var initQuery = PFQuery(className: "purposeItems")
        //initQuery.whereKey("follower", equalTo: PFUser.currentUser().username)
        initQuery.findObjectsInBackgroundWithBlock {
            (objects: [AnyObject]!, error: NSError!) -> Void in
            if error == nil {
                var purposeItems = PFObject(className: "purposeItems")
                var peopleAdoptedArray = [String]()
                for object in objects {
                    
                    var adoptedCountQuery = PFQuery(className: "myPurposeItems")
                    adoptedCountQuery.findObjectsInBackgroundWithBlock{
                        (objects: [AnyObject]!, error: NSError!) -> Void in
                        if error == nil {
                            for object in objects {
                                peopleAdoptedArray.append(object["purposeItemID"] as String)
                            }
                            
                            var peopleAdoptedCount = 0
                            var max = peopleAdoptedArray.count
                            let uniquePurposeId = purposeItems.objectId
                            for var i = 0; i < max; i++ {
                                var Value = peopleAdoptedArray[i]
                                //Find a way to capture the objectId. Xcode is coming up nil.
                                if (Value == uniquePurposeId?){
                                    peopleAdoptedCount++
                                    println("something")
                                } else{
                                    println("nothing")
                                    println(purposeItems.objectId)
                                }
                            }
                            
                            self.itemTitles.append(object["text"] as String)
                            self.itemCategories.append(object["category"] as String)
                            self.peopleAdoptedText.append("\(peopleAdoptedCount) people have adopted")
                            
                            self.tableView.reloadData()
                            /*
                            For uniquePurposeID in peopleAdoptedArray {
                                anotherArray.append("item")
                            }

                            self.peopleAdoptedCount.append(anotherArray.count)
                            */
                        }
                    }
                
                    
                }
            }
        }
        
        /* static values for arrays
        itemTitles = ["1","2","3","4","5"]
        itemCategories = ["1","2","3","4","5"]
        peopleAdoptedArray = ["1","2","3","4","5"]
        */
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
        myCell!.peopleAdopted.text = peopleAdoptedText[indexPath.row]
        return myCell!
        
        }
    
}

/*
1) Find a way to get the objectId. Xcode is coming up nil.
2) Figure out to configure the search bar
3) Figure out how to make the tableView height match the sum of row heights
*/
