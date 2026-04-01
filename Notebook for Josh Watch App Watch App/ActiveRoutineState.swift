//
//  ActiveRoutineState.swift
//  Notebook for Josh Watch App Watch App
//

import Foundation
import WidgetKit

struct ActiveRoutineState {
    static let appGroupID = "group.joshclyde.Notebook-for-Josh-Watch-App"

    private static var sharedDefaults: UserDefaults? {
        UserDefaults(suiteName: appGroupID)
    }

    static var isActive: Bool {
        sharedDefaults?.bool(forKey: "isRoutineActive") ?? false
    }

    static var startDate: Date? {
        sharedDefaults?.object(forKey: "routineStartDate") as? Date
    }

    static var currentTaskName: String? {
        sharedDefaults?.string(forKey: "currentTaskName")
    }

    static var routineTitle: String? {
        sharedDefaults?.string(forKey: "routineTitle")
    }

    static func start(routineTitle: String, taskName: String, startDate: Date) {
        let defaults = sharedDefaults
        defaults?.set(true, forKey: "isRoutineActive")
        defaults?.set(startDate, forKey: "routineStartDate")
        defaults?.set(taskName, forKey: "currentTaskName")
        defaults?.set(routineTitle, forKey: "routineTitle")
        WidgetCenter.shared.reloadAllTimelines()
    }

    static func updateTask(_ taskName: String) {
        sharedDefaults?.set(taskName, forKey: "currentTaskName")
        WidgetCenter.shared.reloadAllTimelines()
    }

    static func complete() {
        let defaults = sharedDefaults
        defaults?.set(false, forKey: "isRoutineActive")
        defaults?.removeObject(forKey: "routineStartDate")
        defaults?.removeObject(forKey: "currentTaskName")
        defaults?.removeObject(forKey: "routineTitle")
        WidgetCenter.shared.reloadAllTimelines()
    }
}
