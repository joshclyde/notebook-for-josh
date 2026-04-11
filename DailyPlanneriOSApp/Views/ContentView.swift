//
//  ContentView.swift
//  Notebook for Josh
//

import SwiftUI
import SwiftData
import DailyPlannerShared

struct ContentView: View {
    var body: some View {
        NavigationStack {
            List {
                NavigationLink("Routine", destination: RoutineListView())
            }
            .navigationTitle("Daily Planner")
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(RoutineTestData.sharedPreview.modelContainer)
}
