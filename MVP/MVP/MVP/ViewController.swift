//
//  ViewController.swift
//  MVP
//
//  Created by Creighton Taylor on 12/1/14.
//  Copyright (c) 2014 iClair. All rights reserved.
//

import UIKit

class ViewController: UIViewController, FBLoginViewDelegate {

    @IBAction func signInWithFacebok(sender: AnyObject) {
        
        var fbLoginView:FBLoginView = FBLoginView(readPermissions: ["public_profile", "email", "user_friends"])
        
        var permissions = ["public_profile", "email", "user_friends"]
        
        PFFacebookUtils.logInWithPermissions(permissions, {
            (user: PFUser!, error: NSError!) -> Void in
            if user == nil {
            
            NSLog("Uh oh. The user cancelled the Facebook login.")
            println("user cancelled login")
            
            } else if user.isNew {
            
            NSLog("User signed up and logged in through Facebook!")
            println("New log in")
            //self.performSegueWithIdentifier("homeSegue", sender: self)
            
            } else {
            
            NSLog("User logged in through Facebook!")
            println("User logged in")
            //self.performSegueWithIdentifier("homeSegue", sender: self)
            }
            })
        
        FBRequestConnection.startForMeWithCompletionHandler({
            connection, result, error in
            
            PFUser.currentUser()["gender"] = result["gender"]
            PFUser.currentUser()["first_name"] = result["first_name"]
            PFUser.currentUser()["last_name"] = result["last_name"]
            PFUser.currentUser()["email"] = result["email"]
            
            PFUser.currentUser().save()
            println(result)
            
        })
        PFUser.currentUser().saveInBackgroundWithBlock {
            (success: Bool!, error: NSError!) -> Void in
            if (success != nil) {
                NSLog("Object created")
            } else {
                NSLog("error")
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if PFUser.currentUser() != nil {
            println("viewDidLoad is working when user logs in")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

