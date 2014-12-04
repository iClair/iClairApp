//
//  NewsFeedViewController.swift
//  MVP
//
//  Created by Creighton Taylor on 12/4/14.
//  Copyright (c) 2014 iClair. All rights reserved.
//

import UIKit

class NewsFeedViewController: UIViewController, SideBarDelegate {
    
    var sideBar:SideBar = SideBar()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sideBar = SideBar(sourceView: self.view, menuItems: ["My Profile", "Get Help", "Give Help", "Settings"])
        sideBar.delegate = self
        
        // Do any additional setup after loading the view.
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
