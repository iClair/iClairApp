//
//  PurposeElementsManagedViewController.swift
//  MVP
//
//  Created by Creighton Taylor on 12/2/14.
//  Copyright (c) 2014 iClair. All rights reserved.
//

import UIKit

class PurposeElementsManagedViewController: UIViewController, UITableViewDelegate {

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
        return 4
    }
    
    // Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
    // Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "cell")
        cell.textLabel.text = "Table Cell Content"
        return cell
    }
    
    let array = ["what you love", "what you are good at", "what the world needs", "what you can be paid for"]
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    
        return array.count
    
    } // Default is 1 if not implemente.ted
    
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
