//
//  DailyDozenStore.swift
//  Notebook for Josh
//

import Foundation
import Observation

@Observable
class DailyDozenStore {
    private(set) var checkedState: [String: [Bool]] = [:]

    private enum Keys {
        static let checkedState = "dailyDozen.checkedState"
        static let lastViewedDate = "dailyDozen.lastViewedDate"
    }

    init() {
        load()
        resetIfNewDay()
    }

    func isChecked(category: DailyDozenCategory, servingIndex: Int) -> Bool {
        (checkedState[category.id] ?? Array(repeating: false, count: category.servings))[servingIndex]
    }

    func toggle(category: DailyDozenCategory, servingIndex: Int) {
        var row = checkedState[category.id] ?? Array(repeating: false, count: category.servings)
        row[servingIndex].toggle()
        checkedState[category.id] = row
        save()
    }

    func markViewed() {
        UserDefaults.standard.set(Date().timeIntervalSinceReferenceDate, forKey: Keys.lastViewedDate)
    }

    // MARK: - Private

    private func resetIfNewDay() {
        let stored = UserDefaults.standard.double(forKey: Keys.lastViewedDate)
        guard stored != 0 else { return }
        let lastDate = Date(timeIntervalSinceReferenceDate: stored)
        if !Calendar.current.isDateInToday(lastDate) {
            checkedState = [:]
            save()
        }
    }

    private func load() {
        guard
            let data = UserDefaults.standard.data(forKey: Keys.checkedState),
            let decoded = try? JSONDecoder().decode([String: [Bool]].self, from: data)
        else { return }
        checkedState = decoded
    }

    private func save() {
        guard let data = try? JSONEncoder().encode(checkedState) else { return }
        UserDefaults.standard.set(data, forKey: Keys.checkedState)
    }
}
