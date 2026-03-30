//
//  ContentView.swift
//  Notebook for Josh Watch App Watch App
//
//  Created by Josh Clyde on 3/30/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            List(sampleRoutines) { routine in
                NavigationLink {
                    RoutineDetailView(routine: routine)
                } label: {
                    VStack(alignment: .leading, spacing: 4) {
                        Text(routine.title)
                            .font(.headline)
                    }
                }
            }
            .navigationTitle("Routines")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct RoutineDetailView: View {
    let routine: Routine
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("\(routine.tasks.count) tasks")
                    .font(.caption)
                    .foregroundStyle(.secondary)
                Text(routine.title)
                    .font(.headline)
                Spacer()
            }
            Spacer()
        }
        .toolbar {
            ToolbarItem(placement: .bottomBar) {
                NavigationLink {
                    PlayRoutine(routine: routine)
                } label: {
                    Image(systemName: "play.fill")
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
