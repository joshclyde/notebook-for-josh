//
//  Notebook_for_JoshApp.swift
//  Notebook for Josh
//
//  Created by Josh Clyde on 3/30/26.
//

import SwiftUI
import SwiftData
import DailyPlannerShared

@main
struct iOSApp: App {
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
            ContentView()
                .modelContainer(container)
        }
    }
}
