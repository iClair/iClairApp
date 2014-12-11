//
//  SearchPreExistingPurposeViewController.swift
//  MVP
//
//  Created by Creighton Taylor on 12/6/14.
//  Copyright (c) 2014 iClair. All rights reserved.
//

import UIKit

class SearchPreExistingPurposeViewController: UIViewController, {

    var itemCategories = [String]()
    var itemTitles = [String]()
    var peopleAdoptedArray:Int //Is this the right way to initialize an integer??
    var images = [UIImage]()
    var imageFiles = [PFFile]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        var getPurposeItemsQuery = PFQuery(className: "purposeItems")
        //getPurposeItemsQuery.whereKey("follower", equalTo: PFUser.currentUser().username)
        getPurposeItemsQuery.findObjectsInBackgroundWithBlock {
            (objects: [AnyObject]!, error: NSError!) -> Void in
            if error == nil {
                
                for object in objects {
                                
                    self.itemTitles.append(object["text"] as String)
                    self.itemCategories.append(object["category"] as String)
                    self.peopleAdoptedArray.append(object["People Adopted"] as Int)
                    self.imageFiles.append(object["imageFile"] as PFFile)
                                
                    self.tableView.reloadData()
                                
                }
            } else {
                println(error)
            }
        }
        
    }
    
        
        
        

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return titles.count
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 21
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var myCell:Cell = self.tableView.dequeueReusableCellWithIdentifier("myCell") as Cell
        
        myCell.itemCategory.text = itemCategories[indexPath.row]
        myCell.itemTitle.text = itemTitles[indexPath.row]
        myCell.peopleAdopted.text = peopleAdoptedArray[indexPath.row]
        
        imageFiles[indexPath.row].getDataInBackgroundWithBlock{
            (imageData: NSData!, error: NSError!) -> Void in
            
            if error == nil {
                
                let image = UIImage(data: imageData)
                
                myCell.postedImage.image = image
            }
            
            
        }
        
        
        return myCell
        
    }

}
