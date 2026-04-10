//
//  Notebook_for_Josh_Watch_AppApp.swift
//  Notebook for Josh Watch App Watch App
//
//  Created by Josh Clyde on 3/30/26.
//

import SwiftUI
import SwiftData
import DailyPlannerShared

@main
struct WatchOSApp: App {
    let container: ModelContainer

    init() {
        do {
            let schema = Schema([Routine.self])
            let config = ModelConfiguration(
                schema: schema,
                cloudKitDatabase: .private(Constants.Identifiers.iCloudContainer)
            )
            container = try ModelContainer(for: schema, configurations: config)
        } catch {
            fatalError("Failed to create ModelContainer: \(error)")
        }
    }

    var body: some Scene {
        WindowGroup {
            RoutineListView()
                .modelContainer(container)
                .onAppear {
                    NotificationManager.requestAuthorizationAndSchedule()
                }
        }
    }
}
