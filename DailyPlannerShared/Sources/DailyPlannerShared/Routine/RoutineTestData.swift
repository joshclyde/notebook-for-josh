import SwiftUI
import SwiftData

@MainActor
public struct RoutineTestData {
    public var helloWorld: String = "Hello, world!"
    public var modelContainer: ModelContainer
    
    public init(helloWorld: String) {
        // Create an in-memory configuration so preview data isn't saved permanently
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        self.modelContainer = try! ModelContainer(for: Routine.self, configurations: config)
        
        // Insert dummy data into the preview's context
        self.modelContainer.mainContext.insert(Routine(
            title: "Foo",
            tasks: ["Task 1", "Task 2", "Task 3"],
            sortOrder: 0
        ))
        self.modelContainer.mainContext.insert(Routine(
            title: "Bar",
            tasks: ["Task 1", "Task 2", "Task 3"],
            sortOrder: 1
        ))
    }
    
    public static let sharedPreview: RoutineTestData = {
        RoutineTestData(helloWorld: "foo")
    }()
}


