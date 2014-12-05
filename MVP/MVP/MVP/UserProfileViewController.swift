//
//  UserProfileViewController.swift
//  MVP
//
//  Created by Creighton Taylor on 12/4/14.
//  Copyright (c) 2014 iClair. All rights reserved.
//

import UIKit

class UserProfileViewController: UIViewController, SideBarDelegate {
    @IBOutlet weak var profilePic: UIImageView!
    @IBOutlet weak var profileFullName: UILabel!
    @IBOutlet weak var visionStatement: UITextView!
    @IBOutlet weak var bandBelowPostButton: UILabel!
    @IBOutlet weak var visionStatementPostButton: UIButton!

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
    
        /*AppDelegate is crashing all of sudden. So testing without.
        sideBar = SideBar(sourceView: self.view, menuItems: ["My Profile", "Get Help", "Give Help", "Settings"])
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
