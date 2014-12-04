//
//  AddPurposeItemsViewController.swift
//  MVP
//
//  Created by Creighton Taylor on 12/3/14.
//  Copyright (c) 2014 iClair. All rights reserved.
//

import UIKit

class AddPurposeItemsViewController: UIViewController, UIPickerViewDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    

    //"what do you love" outlets
    @IBOutlet weak var whatYouLoveBackground: UILabel!
    @IBOutlet weak var whatDoYouLove: UILabel!
    @IBOutlet weak var iLove: UILabel!
    @IBOutlet weak var whatYouLoveTextField: UITextField!
    @IBAction func whatYouLoveTextField(sender: AnyObject) {
    }
    
    //"what are you good at" outlets
    @IBOutlet weak var whatYouAreGoodAtBackground: UILabel!
    @IBOutlet weak var whatAreYouGoodAt: UILabel!
    @IBOutlet weak var imGoodAt: UILabel!
    @IBOutlet weak var whatYouAreGoodAtTextField: UITextField!
    @IBAction func whatYouAreGoodAtTextField(sender: AnyObject) {
    }
    
    //"what the world needs" outlets
    @IBOutlet weak var whatTheWorldNeedsBackground: UILabel!
    @IBOutlet weak var whatDoesTheWorldNeed: UILabel!
    @IBOutlet weak var theWorldNeedsMore: UILabel!
    @IBOutlet weak var whatTheWorldNeedsTextField: UITextField!
    @IBAction func whatTheWorldNeedsTextField(sender: AnyObject) {
    }
    
    //"what you can be paid for" outlets
    @IBOutlet weak var whatYouCanBePaidForBackground: UILabel!
    @IBOutlet weak var whatCanYouBePaidFor: UILabel!
    @IBOutlet weak var iCanBuildACareer: UILabel!
    @IBOutlet weak var whatCanYouBePaidForTextField: UITextField!
    @IBAction func whatCanYouBePaidForTextField(sender: AnyObject) {
    }
    
    
    @IBOutlet weak var pickedImage: UIImageView!
    
    func imagePickerController(picker: UIImagePickerController!, didFinishPickingImage image: UIImage!, editingInfo: [NSObject : AnyObject]!) {
    println("Image selected")
    self.dismissViewControllerAnimated(true, completion: nil)
    
    pickedImage.image = image
    
    }
    
    @IBAction func pickImage(sender: AnyObject) {
    
    var image = UIImagePickerController()
    image.delegate = self
    image.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
    image.allowsEditing = false
    
    self.presentViewController(image, animated: true, completion: nil)
    
    }
    
    var purposeAreas = ["what you love", "what you are good at", "what the world needs", " what you can be paid for"]
    
    // returns the number of 'columns' to display.
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
    return 1
    }
    
    // returns the # of rows in each component..
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
    return purposeAreas.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
    
    return purposeAreas[row]
    
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    
    var purposeAreaSelected = purposeAreas[row]
    
    if (purposeAreaSelected == "what you love") {
    self.whatYouLoveBackground.alpha = 0.5
    self.whatDoYouLove.alpha = 1
    self.iLove.alpha = 1
    self.whatYouLoveTextField.alpha = 1
    self.whatYouAreGoodAtBackground.alpha = 0
    self.whatAreYouGoodAt.alpha = 0
    self.imGoodAt.alpha = 0
    self.whatYouAreGoodAtTextField.alpha = 0
    self.whatYouAreGoodAtTextField.text = ""
    self.whatTheWorldNeedsBackground.alpha = 0
    self.whatDoesTheWorldNeed.alpha = 0
    self.theWorldNeedsMore.alpha = 0
    self.whatTheWorldNeedsTextField.alpha = 0
    self.whatTheWorldNeedsTextField.text = ""
    self.whatYouCanBePaidForBackground.alpha = 0
    self.whatCanYouBePaidFor.alpha = 0
    self.iCanBuildACareer.alpha = 0
    self.whatCanYouBePaidForTextField.alpha = 0
    self.whatCanYouBePaidForTextField.text = ""
    println("what you love")
    } else if (purposeAreaSelected == "what you are good at"){
    self.whatYouLoveBackground.alpha = 0
    self.whatDoYouLove.alpha = 0
    self.iLove.alpha = 0
    self.whatYouLoveTextField.alpha = 0
    self.whatYouLoveTextField.text = ""
    self.whatYouAreGoodAtBackground.alpha = 0.5
    self.whatAreYouGoodAt.alpha = 1
    self.imGoodAt.alpha = 1
    self.whatYouAreGoodAtTextField.alpha = 1
    self.whatTheWorldNeedsBackground.alpha = 0
    self.whatDoesTheWorldNeed.alpha = 0
    self.theWorldNeedsMore.alpha = 0
    self.whatTheWorldNeedsTextField.alpha = 0
    self.whatTheWorldNeedsTextField.text = ""
    self.whatYouCanBePaidForBackground.alpha = 0
    self.whatCanYouBePaidFor.alpha = 0
    self.iCanBuildACareer.alpha = 0
    self.whatCanYouBePaidForTextField.alpha = 0
    self.whatCanYouBePaidForTextField.text = ""
    println("what you are good at")
    } else if (purposeAreaSelected == "what the world needs"){
    self.whatYouLoveBackground.alpha = 0
    self.whatDoYouLove.alpha = 0
    self.iLove.alpha = 0
    self.whatYouLoveTextField.alpha = 0
    self.whatYouLoveTextField.text = ""
    self.whatYouAreGoodAtBackground.alpha = 0
    self.whatAreYouGoodAt.alpha = 0
    self.imGoodAt.alpha = 0
    self.whatYouAreGoodAtTextField.alpha = 0
    self.whatYouAreGoodAtTextField.text = ""
    self.whatTheWorldNeedsBackground.alpha = 0.5
    self.whatDoesTheWorldNeed.alpha = 1
    self.theWorldNeedsMore.alpha = 1
    self.whatTheWorldNeedsTextField.alpha = 1
    self.whatYouCanBePaidForBackground.alpha = 0
    self.whatCanYouBePaidFor.alpha = 0
    self.iCanBuildACareer.alpha = 0
    self.whatCanYouBePaidForTextField.alpha = 0
    self.whatCanYouBePaidForTextField.text = ""
    println("what the world needs")
    } else {
    self.whatYouLoveBackground.alpha = 0
    self.whatDoYouLove.alpha = 0
    self.iLove.alpha = 0
    self.whatYouLoveTextField.alpha = 0
    self.whatYouLoveTextField.text = ""
    self.whatYouAreGoodAtBackground.alpha = 0
    self.whatAreYouGoodAt.alpha = 0
    self.imGoodAt.alpha = 0
    self.whatYouAreGoodAtTextField.alpha = 0
    self.whatYouAreGoodAtTextField.text = ""
    self.whatTheWorldNeedsBackground.alpha = 0
    self.whatDoesTheWorldNeed.alpha = 0
    self.theWorldNeedsMore.alpha = 0
    self.whatTheWorldNeedsTextField.alpha = 0
    self.whatTheWorldNeedsTextField.text = ""
    self.whatYouCanBePaidForBackground.alpha = 0.5
    self.whatCanYouBePaidFor.alpha = 1
    self.iCanBuildACareer.alpha = 1
    self.whatCanYouBePaidForTextField.alpha = 1
    println("what you can be paid for")
    }
    
    }

    @IBAction func submitPurposeItemButton(sender: AnyObject) {
    
    var purposeItemsCategoryText = ""
    var purposeItemsCategory = ""
    
    if (self.whatYouLoveTextField.alpha == 1) {
    purposeItemsCategoryText = self.whatYouLoveTextField.text
    purposeItemsCategory = "What you love"
    } else if (self.whatYouAreGoodAtTextField.alpha == 1){
    purposeItemsCategoryText = self.whatYouAreGoodAtTextField.text
    purposeItemsCategory = "What you are good at"
    } else if (self.whatTheWorldNeedsTextField.alpha == 1){
    purposeItemsCategoryText = self.whatTheWorldNeedsTextField.text
    purposeItemsCategory = "What the world needs"
    } else {
    purposeItemsCategoryText = self.whatCanYouBePaidForTextField.text
    purposeItemsCategory = "What you can be paid for"
    }
    
    var purposeItems = PFObject(className:"purposeItems")
    purposeItems["text"] = purposeItemsCategoryText
    purposeItems["category"] = purposeItemsCategory
    //purposeItems["image"] = self.pickedImage.image
    //purposeItems.save()
    
    /* code from lecture 109 to save down image with other variables
    purposeItems.saveInBackgroundWithBlock{(success: Bool!, error: NSError!) -> Void in
            
            
        if success == false {
            
            self.activityIndicator.stopAnimating()
                UIApplication.sharedApplication().endIgnoringInteractionEvents()
                
            self.displayAlert("Could Not Post Image", error: "Please try again later")
                
        } else {
                
            let imageData = UIImagePNGRepresentation(self.imageToPost.image)
                
            let imageFile = PFFile(name: "image.png", data: imageData)
                
            post["imageFile"] = imageFile
                
            post.saveInBackgroundWithBlock{(success: Bool!, error: NSError!) -> Void in
                    
                self.activityIndicator.stopAnimating()
                UIApplication.sharedApplication().endIgnoringInteractionEvents()
                    
                if success == false {
                        
                    self.displayAlert("Could Not Post Image", error: "Please try again later")
                        
                } else {
                        
                    self.displayAlert("Image Posted!", error: "Your image has been posted successfully")
                        
                    self.photoSelected = 0
                        
                    self.imageToPost.image = UIImage(named: "315px-Blank_woman_placeholder.svg")
                        
                    self.shareText.text = ""
                        
                    println("posted successfully")
                        
                }
                    
            }*/
        

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
