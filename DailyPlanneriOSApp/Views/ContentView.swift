//
//  ContentView.swift
//  Notebook for Josh
//

import SwiftUI
import SwiftData
import DailyPlannerShared

struct ContentView: View {
    @Environment(\.modelContext) private var context
    @Query(sort: \Routine.sortOrder) private var routines: [Routine]
    @State private var showingAddRoutine = false

    var body: some View {
        NavigationStack {
            Group {
                if routines.isEmpty {
                    ContentUnavailableView(
                        "No Routines",
                        systemImage: "list.bullet",
                        description: Text("Tap + to add your first routine.")
                    )
                } else {
                    List {
                        ForEach(routines) { routine in
                            NavigationLink(destination: EditRoutineView(routine: routine)) {
                                VStack(alignment: .leading, spacing: 4) {
                                    Text(routine.title)
                                        .font(.headline)
                                    Text("\(routine.tasks.count) task\(routine.tasks.count == 1 ? "" : "s")")
                                        .font(.caption)
                                        .foregroundStyle(.secondary)
                                }
                                .padding(.vertical, 2)
                            }
                        }
                        .onDelete(perform: deleteRoutines)
                        .onMove(perform: moveRoutines)
                    }
                }
            }
            .navigationTitle("Routines")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    if !routines.isEmpty { EditButton() }
                }
                ToolbarItem(placement: .primaryAction) {
                    Button { showingAddRoutine = true } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $showingAddRoutine) {
                AddRoutineView()
            }
        }
    }

    private func deleteRoutines(at offsets: IndexSet) {
        for index in offsets {
            context.delete(routines[index])
        }
    }

    private func moveRoutines(from source: IndexSet, to destination: Int) {
        var reordered = routines
        reordered.move(fromOffsets: source, toOffset: destination)
        for (index, routine) in reordered.enumerated() {
            routine.sortOrder = index
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(RoutineTestData.sharedPreview.modelContainer)
}
