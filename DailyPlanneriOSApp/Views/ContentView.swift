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
//            .onAppear {
//                seedDataIfNeeded()
//            }
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

    private func seedDataIfNeeded() {
        let seedKey = "routines_seeded_v1"
        guard !UserDefaults.standard.bool(forKey: seedKey) else { return }
        guard routines.isEmpty else {
            UserDefaults.standard.set(true, forKey: seedKey)
            return
        }
        context.insert(Routine(
            title: "Wake Up",
            tasks: [
                "Get out of bed",
                "Make the bed",
                "Let Daisy out of the attic",
                "Feed the cats",
                "Drink water",
                "Allergy medicine (Allegra)",
                "Eat yogurt (while doing next tasks)",
                "Refill cat's water",
                "Put away dishes",
                "Drink water",
                "Scoop litter?",
                "Vacuum first floor",
                "Brush teeth",
                "Deodorant",
                "Style hair?",
                "Coffee",
                "Lotion hands",
                "Sit down and plan for the day",
            ],
            sortOrder: 0
        ))
        context.insert(Routine(
            title: "Wind Down",
            tasks: [
                "Clean the dishes",
                "Run the dishwasher?",
                "Clean the kitchen counter",
                "Refill kitten water",
                "Check kitten food in auto feeder",
                "Floss & Brush Teeth",
                "Clean face",
                "Gameboy (15 minutes)",
                "Read book",
                "Put away kitten",
            ],
            sortOrder: 1
        ))
        UserDefaults.standard.set(true, forKey: seedKey)
    }
}

#Preview {
    ContentView()
        .modelContainer(RoutineTestData.sharedPreview.modelContainer)
}
