//
//  NotificationManager.swift
//  Notebook for Josh Watch App Watch App
//

import UserNotifications

struct NotificationManager {

    static func requestAuthorizationAndSchedule() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound]) { granted, _ in
            guard granted else { return }
            scheduleRoutineNotifications()
        }
    }

    private static func scheduleRoutineNotifications() {
        let center = UNUserNotificationCenter.current()
        // Remove any previously scheduled routine reminders before re-scheduling
        center.removePendingNotificationRequests(withIdentifiers: ["wakeup-routine", "winddown-routine"])

        center.add(makeRequest(id: "wakeup-routine", title: "Wake Up", hour: 6, minute: 30))
        center.add(makeRequest(id: "winddown-routine", title: "Wind Down", hour: 21, minute: 30))
    }

    private static func makeRequest(id: String, title: String, hour: Int, minute: Int) -> UNNotificationRequest {
        let content = UNMutableNotificationContent()
        content.title = "Time to \(title)"
        content.body = "Start your \(title) routine"
        content.sound = .default

        var components = DateComponents()
        components.hour = hour
        components.minute = minute
        let trigger = UNCalendarNotificationTrigger(dateMatching: components, repeats: true)

        return UNNotificationRequest(identifier: id, content: content, trigger: trigger)
    }
}
