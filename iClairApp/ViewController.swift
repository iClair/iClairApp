//
//  ViewController.swift
//  iClairApp
//
//  Created by Creighton Taylor on 11/25/14.
//  Copyright (c) 2014 iClair. All rights reserved.
//

import UIKit

class ViewController: UIViewController, FBLoginViewDelegate {
    
    
    @IBOutlet weak var logInCancelledLabel: UILabel!
    
    @IBAction func signIn(sender: AnyObject) {
    
        var fbLoginView:FBLoginView = FBLoginView(readPermissions: ["public_profile", "email", "user_friends"])
        
        var permissions = ["public_profile", "email", "user_friends"]
        
        self.logInCancelledLabel.alpha = 0
        
        PFFacebookUtils.logInWithPermissions(permissions, {
            (user: PFUser!, error: NSError!) -> Void in
            if user == nil {
                NSLog("Uh oh. The user cancelled the Facebook login.")
                
                self.logInCancelledLabel.alpha = 1
                println("user cancelled login")
                
            } else if user.isNew {
                NSLog("User signed up and logged in through Facebook!")
                
            self.performSegueWithIdentifier("signUp", sender: self)
                println("New log in")
                
            } else {
                NSLog("User logged in through Facebook!")
                println("User logged in")
            }
        })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if PFUser.currentUser() != nil {
            
            println("User logged in already")
            self.performSegueWithIdentifier("manageLivesSegue", sender: self)
            
        }
        
        /*
        //adding a user manually
        var user = PFUser()
        user.username = "myUsername2"
        user.password = "myPassword2"
        user.email = "email@example.com2"
        
        user.signUpInBackgroundWithBlock {
            (succeeded: Bool!, error: NSError!) -> Void in
            if error == nil {
                // Hooray! Let them use the app now.
            } else {
                let errorString = error.userInfo?["error"] as NSString
                // Show the errorString somewhere and let the user try again.
            }
        }*/
        
        /*
        /*Gives user's location - "Adding Users" swift Tinder session explains. Paste in RELEVANT CONTROLLLER. Still need to input NSLocationWhenInUseUsageDescription*/
        PFGeoPoint.geoPointForCurrentLocationInBackground { (geopoint: PFGeoPoint!, error: NSError!) -> Void in
            
            if error == nil {
            
                println(geopoint)
        
                var user = PFUser.currentUser()
                
                user["location"] = geopoint
                
                user.save()
            }
        }*/
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


