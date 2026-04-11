//
//  AddRoutineView.swift
//  Notebook for Josh
//

import SwiftUI
import SwiftData
import DailyPlannerShared

struct AddRoutineView: View {
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss
    @Query(sort: \Routine.sortOrder) private var routines: [Routine]

    @State private var title = ""
    @State private var tasks: [String] = [""]
    @FocusState private var focusedIndex: Int?

    var body: some View {
        NavigationStack {
            Form {
                Section("Routine Name") {
                    TextField("Name", text: $title)
                }
                Section("Tasks") {
                    ForEach(tasks.indices, id: \.self) { index in
                        HStack {
                            TextField("Task \(index + 1)", text: $tasks[index])
                                .focused($focusedIndex, equals: index)
                                .onSubmit { insertTask(after: index) }
                            if tasks.count > 1 {
                                Button {
                                    tasks.remove(at: index)
                                } label: {
                                    Image(systemName: "minus.circle.fill")
                                        .foregroundStyle(.red)
                                }
                                .buttonStyle(.plain)
                            }
                        }
                    }
                    .onMove { tasks.move(fromOffsets: $0, toOffset: $1) }
                    .onDelete { tasks.remove(atOffsets: $0) }
                    Button { insertTask(after: tasks.count - 1) } label: {
                        Label("Add Task", systemImage: "plus")
                    }
                }
            }
            .navigationTitle("New Routine")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") { dismiss() }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Add") { save() }
                        .disabled(title.trimmingCharacters(in: .whitespaces).isEmpty)
                }
            }
        }
    }

    private func insertTask(after index: Int) {
        tasks.insert("", at: index + 1)
        focusedIndex = index + 1
    }

    private func save() {
        let cleanedTasks = tasks
            .map { $0.trimmingCharacters(in: .whitespaces) }
            .filter { !$0.isEmpty }
        context.insert(Routine(
            title: title.trimmingCharacters(in: .whitespaces),
            tasks: cleanedTasks,
            sortOrder: routines.count
        ))
        dismiss()
    }
}
