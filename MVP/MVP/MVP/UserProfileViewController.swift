//
//  UserProfileViewController.swift
//  MVP
//
//  Created by Creighton Taylor on 12/4/14.
//  Copyright (c) 2014 iClair. All rights reserved.
//

import UIKit

class UserProfileViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate { //SideBarDelegate...random error. Don't conform.
    
    @IBOutlet weak var profilePic: UIImageView!
    @IBOutlet weak var profileFullName: UILabel!
    @IBOutlet weak var visionStatement: UITextView!
    @IBOutlet weak var bandBelowPostButton: UILabel!
    @IBOutlet weak var visionStatementPostButton: UIButton!
    @IBAction func visionStatementPostButton(sender: AnyObject) {
        
        var error = ""
        
        if (visionStatement.text == ""){
            error = "Please enter your vision"
            //input displayAlert function as in lecture 109
        }
        
        var visionStatementPost = PFObject(className: "Vision Statement")
        visionStatementPost["text"] = visionStatement.text
        visionStatementPost["username"] = PFUser.currentUser().username
        visionStatementPost.saveInBackgroundWithBlock{(success: Bool!, error: NSError!) -> Void in
            if success == false{
                println("error")
            } else {
                println("success")
            }
        
        }
        
    }
    
    @IBAction func chooseProfilePic(sender: AnyObject) {
        var image = UIImagePickerController()
        image.delegate = self
        image.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        image.allowsEditing = false
        
        self.presentViewController(image, animated: true, completion: nil)
    }

    func imagePickerController(picker: UIImagePickerController!, didFinishPickingImage image: UIImage!, editingInfo: [NSObject : AnyObject]!) {
        println("image selected")
        self.dismissViewControllerAnimated(true, completion: nil)
        
        profilePic.image = image
        
        var profilePicSaved = PFObject(className: "Profile Pic")
        profilePicSaved["username"] = PFUser.currentUser().username
        profilePicSaved.saveInBackgroundWithBlock{(success: Bool!, error: NSError!) -> Void in
            if success == false{
                println("error")
            } else {
                println("success")
            
                let imageData = UIImagePNGRepresentation(self.profilePic.image)
            
                let imageFile = PFFile(name: "image.png", data: imageData)
            
                profilePicSaved["imageFile"] = imageFile
            
                profilePicSaved.saveInBackgroundWithBlock{(success: Bool!, error: NSError!) -> Void in
                
                    if success == false {
                    
                        println("Please try again later. Did not save successfully")
                        //need to have an error message displayed here
                    
                    } else {
                        
                        println("saved successfully!")
                    }
                }
            }
        
        }
    }

    var sideBar:SideBar = SideBar()
    
    func textViewDidBeginEditing(textView: UITextView){
        
        /* My failed attempt to change text color to mimic Placeholder Text
        if (visionStatement.text == "what's your vision?"){
            visionStatement.clearsOnInsertion = true
            VisionStatement.textColor = UIColor.lightGrayColor()
            println("did this work?")
        } else{
            visionStatement.clearsOnInsertion = false
            visionStatement.textColor = UIColor.blackColor()
            println("did this work?")
        }*/

    }
    func textViewDidEndEditing(textView: UITextView){
    
    }
    /* My failed attempt to introduce a character limit
    func textView(textView: UITextView, shouldChangeTextInRange range: NSRange, replacementText text: String) -> Bool{
        
        if textView.text.lengthOfBytesUsingEncoding
        return true
    }
    */

    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        /*My failed attempt to include a blurry side bar
        sideBar = SideBar(sourceView: self.view, menuItems: ["My Profile", "Get Help", "Give Help", "Settings", "Logout"])
        sideBar.delegate = self

        visionStatement.editable = true
        visionStatement.selectable = true
        */
        
        /* My failed attempt to put borders around the Vision Statement area
        bandBelowPostButton.layer.borderColor = UIColor.blueColor().CGColor
        bandBelowPostButton.layer.borderWidth = 3.0
        visionStatement.layer.borderColor = UIColor.blueColor().CGColor
        visionStatement.layer.borderWidth = 3.0
        */
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func sideBarDidSelectButtonAtIndex(index: Int) {
        if index == 0{
            println("Profile Tapped")
        }
    }

}
