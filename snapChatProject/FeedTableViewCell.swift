//
//  FeedTableViewCell.swift
//  snapChatProject
//
//  Created by Marisa Wong on 3/13/17.
//  Copyright © 2017 org.iosdecal. All rights reserved.
//

import UIKit

class FeedTableViewCell: UITableViewCell {

    
    @IBOutlet weak var redButton: UIImageView!
    @IBOutlet weak var senderName: UILabel!
    @IBOutlet weak var timeSent: UILabel!
    
    var holdImage: UIImage? 
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
