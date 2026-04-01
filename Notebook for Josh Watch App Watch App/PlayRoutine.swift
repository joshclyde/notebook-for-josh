//
//  PlayRoutine.swift
//  Notebook for Josh Watch App Watch App
//

import SwiftUI

struct PlayRoutine: View {
    let routine: Routine

    @State private var currentTaskIndex = 0
    @State private var isCompleted = false
    @State private var startDate = Date()

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                HStack {
                    Text(startDate, style: .timer)
                        .font(.caption)
                        .foregroundStyle(.secondary)
                    Spacer()
                    Text("\(currentTaskIndex + 1) of \(routine.tasks.count)")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }
                Text(
                    isCompleted ? "Completed" : routine.tasks[currentTaskIndex]
                )
                .font(.headline)

                Spacer()
            }
            Spacer()
        }
        .toolbar {
            if !isCompleted {
                ToolbarItem(placement: .bottomBar) {
                    Button {
                        currentTaskIndex -= 1
                    } label: {
                        Image(systemName: "chevron.left")
                    }
                    .disabled(currentTaskIndex == 0)
                }
                ToolbarItem(placement: .bottomBar) {
                    Button {
                        if currentTaskIndex < routine.tasks.count - 1 {
                            currentTaskIndex += 1
                        } else {
                            isCompleted = true
                        }
                    } label: {
                        Image(systemName: "forward.end")
                            .foregroundStyle(.blue)
                    }
                }
                ToolbarItem(placement: .bottomBar) {
                    Button {
                        if currentTaskIndex < routine.tasks.count - 1 {
                            currentTaskIndex += 1
                        } else {
                            isCompleted = true
                        }
                    } label: {
                        Image(systemName: "checkmark")
                            .foregroundStyle(.green)
                    }
                }
            }
        }
        .onAppear {
            ActiveRoutineState.start(
                routineTitle: routine.title,
                taskName: routine.tasks[currentTaskIndex],
                startDate: startDate
            )
        }
        .onDisappear {
            ActiveRoutineState.complete()
        }
        .onChange(of: currentTaskIndex) {
            ActiveRoutineState.updateTask(routine.tasks[currentTaskIndex])
        }
        .onChange(of: isCompleted) {
            if isCompleted {
                ActiveRoutineState.complete()
            }
        }
    }
}
