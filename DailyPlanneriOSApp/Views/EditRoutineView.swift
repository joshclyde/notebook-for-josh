//
//  EditRoutineView.swift
//  Notebook for Josh
//

import SwiftUI
import DailyPlannerShared

struct EditRoutineView: View {
    @Bindable var routine: Routine

    @State private var tasks: [String] = []
    @FocusState private var focusedIndex: Int?

    var body: some View {
        Form {
            Section("Routine Name") {
                TextField("Name", text: $routine.title)
            }
            Section("Tasks") {
                ForEach(tasks.indices, id: \.self) { index in
                    HStack {
                        TextField("Task \(index + 1)", text: $tasks[index])
                            .focused($focusedIndex, equals: index)
                            .onSubmit { insertTask(after: index) }
                            .onChange(of: tasks[index]) { syncTasks() }
                        if tasks.count > 1 {
                            Button {
                                tasks.remove(at: index)
                                syncTasks()
                            } label: {
                                Image(systemName: "minus.circle.fill")
                                    .foregroundStyle(.red)
                            }
                            .buttonStyle(.plain)
                        }
                    }
                }
                .onMove { tasks.move(fromOffsets: $0, toOffset: $1); syncTasks() }
                .onDelete { tasks.remove(atOffsets: $0); syncTasks() }
                Button { insertTask(after: tasks.count - 1) } label: {
                    Label("Add Task", systemImage: "plus")
                }
            }
        }
        .navigationTitle("Edit Routine")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar { EditButton() }
        .onAppear {
            tasks = routine.tasks.isEmpty ? [""] : routine.tasks
        }
    }

    private func insertTask(after index: Int) {
        tasks.insert("", at: index + 1)
        focusedIndex = index + 1
        syncTasks()
    }

    private func syncTasks() {
        routine.tasks = tasks
            .map { $0.trimmingCharacters(in: .whitespaces) }
            .filter { !$0.isEmpty }
    }
}
