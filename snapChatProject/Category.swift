//
//  Category.swift
//  snapChatProject
//
//  Created by Marisa Wong on 3/14/17.
//  Copyright © 2017 org.iosdecal. All rights reserved.
//

import Foundation

import UIKit

class Category {
    var heading: String?
    var items: [UIImage]?
    
    init (title: String, objects: [UIImage]) {
        self.heading = title
        self.items = objects
    }

}
