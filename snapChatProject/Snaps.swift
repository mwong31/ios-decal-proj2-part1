//
//  Snaps.swift
//  snapChatProject
//
//  Created by Marisa Wong on 3/14/17.
//  Copyright © 2017 org.iosdecal. All rights reserved.
//

import Foundation
import UIKit

class Snaps {
    var sender: String?
    var unread = #imageLiteral(resourceName: "unread")
    var timeAgo: NSDate?
    var pic: UIImage?
    var feed: String?
    
    init (sender: String, timeAgo: NSDate, pic: UIImage, feed: String) {
        self.sender = sender
        self.timeAgo = timeAgo
        self.pic = pic
        self.feed = feed
    }
    

}
