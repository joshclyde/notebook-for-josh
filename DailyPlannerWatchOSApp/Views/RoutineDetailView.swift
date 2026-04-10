import SwiftUI
import SwiftData
import DailyPlannerShared

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
                    RoutinePlayerView(routine: routine)
                } label: {
                    Image(systemName: "play.fill")
                }
            }
        }
    }
}
