//
//  Item.swift
//  Notebook for Josh
//
//  Created by Josh Clyde on 3/30/26.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
