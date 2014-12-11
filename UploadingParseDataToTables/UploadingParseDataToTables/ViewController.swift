//
//  ViewController.swift
//  UploadingParseDataToTables
//
//  Created by Creighton Taylor on 12/8/14.
//  Copyright (c) 2014 iClair. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

   
    var signUpActive = true
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var logInOutlet: UIButton!
    @IBOutlet weak var signUpOutlet: UIButton!
    @IBOutlet weak var alreadyRegistered: UILabel!
    
    @IBAction func logInButton(sender: AnyObject) {
        if signUpActive == true{
            signUpActive = false
            signUpOutlet.setTitle("Log In", forState: UIControlState.Normal)
            alreadyRegistered.text = "Not Regstered?"
            logInOutlet.setTitle("Sign Up", forState: UIControlState.Normal)
        } else {
            signUpActive = true
            logInOutlet.setTitle("Sign Up", forState: UIControlState.Normal)
            alreadyRegistered.text = "Already registered?"
            signUpOutlet.setTitle("Log In", forState: UIControlState.Normal)
        }
        
    }
    @IBAction func signUp(sender: AnyObject) {
        
        var error = ""
        
        if username.text == "" || password.text == "" {
        
        error = "Please enter a username and password"
        }
        
        if error != "" {
        var alert = UIAlertController(title: "Error in Form", message: error, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "OK", style: .Default, handler: { action in
        
        self.dismissViewControllerAnimated(true, completion: nil)
        
        }))
        
        self.presentViewController(alert, animated: true, completion: nil)
    } else {
        if signUpActive == true {
        
        var user = PFUser()
        user.username = username.text
        user.password = password.text
        
        user.signUpInBackgroundWithBlock {
        (succeeded: Bool!, signUpError: NSError!) -> Void in
        if signUpError == nil {
        self.performSegueWithIdentifier("signUpUserProfileSegue", sender: self)
        println("new user signed up")
    } else {
        println("error on signUp")
        }
        }
    } else{
        
        PFUser.logInWithUsernameInBackground(username.text, password:password.text) {
        (user: PFUser!, signUpError: NSError!) -> Void in
        if signUpError == nil {
        //self.performSegueWithIdentifier("logInNewsFeedSegue", sender: self)
        println("existing user logged in")
    } else {
        println(signUpError)
        }
        }
        }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

