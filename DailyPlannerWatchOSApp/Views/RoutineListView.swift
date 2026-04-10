import SwiftUI
import SwiftData
import DailyPlannerShared

struct RoutineListView: View {
    @Query(sort: \Routine.sortOrder) private var routines: [Routine]

    var body: some View {
        NavigationStack {
            Group {
                if routines.isEmpty {
                    VStack(spacing: 8) {
                        Image(systemName: "list.bullet")
                            .font(.largeTitle)
                            .foregroundStyle(.secondary)
                        Text("No Routines")
                            .font(.headline)
                        Text("Add routines in the iPhone app")
                            .font(.caption)
                            .foregroundStyle(.secondary)
                            .multilineTextAlignment(.center)
                    }
                } else {
                    List(routines) { routine in
                        NavigationLink {
                            RoutineDetailView(routine: routine)
                        } label: {
                            VStack(alignment: .leading, spacing: 4) {
                                Text(routine.title)
                                    .font(.headline)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Routines")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    RoutineListView().modelContainer(RoutineTestData.sharedPreview.modelContainer)
}

