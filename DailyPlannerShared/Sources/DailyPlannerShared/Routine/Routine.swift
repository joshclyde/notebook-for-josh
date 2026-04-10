//
//  Routine.swift
//  Notebook for Josh Watch App Watch App
//

import Foundation
import SwiftData

@Model
public final class Routine {
    public var title: String = ""
    public var tasks: [String] = []
    public var sortOrder: Int = 0

    public init(title: String, tasks: [String], sortOrder: Int = 0) {
        self.title = title
        self.tasks = tasks
        self.sortOrder = sortOrder
    }
}
