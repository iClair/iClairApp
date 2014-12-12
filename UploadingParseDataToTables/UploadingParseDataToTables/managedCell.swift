//
//  managedCell.swift
//  UploadingParseDataToTables
//
//  Created by Creighton Taylor on 12/11/14.
//  Copyright (c) 2014 iClair. All rights reserved.
//

import UIKit

class managedCell: UITableViewCell {
    
    @IBOutlet weak var associatedImage: UIImageView!
    @IBOutlet weak var itemTitle: UILabel!
    @IBOutlet weak var itemCategory: UILabel!
    @IBOutlet weak var peopleAdopted: UILabel!
    
    @IBAction func addItem(sender: AnyObject) {
    }

    @IBAction func showPeople(sender: AnyObject) {
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
