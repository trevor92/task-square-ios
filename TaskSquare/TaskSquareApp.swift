import SwiftUI
import SwiftData

@main
struct TaskSquareApp: App {
    var body: some Scene {
        WindowGroup {
            TaskListView()
        }
        .modelContainer(for: Task.self)
    }
}
