//
//  Collection.swift
//  snapChatProject
//
//  Created by Marisa Wong on 3/14/17.
//  Copyright © 2017 org.iosdecal. All rights reserved.
//

import Foundation

extension Collection where Iterator.Element: Equatable {
    public func split(separator: Self.Iterator.Element,
                      maxSplits: Int =, default,
        omittingEmptySubsequences: Bool = default)
        -> [Self.SubSequence]
}
