import Foundation
import SwiftData

@Model
final class Task {
    var title: String
    var detail: String
    var isCompleted: Bool
    var createdAt: Date

    init(title: String, detail: String = "", isCompleted: Bool = false) {
        self.title = title
        self.detail = detail
        self.isCompleted = isCompleted
        self.createdAt = Date()
    }
}
