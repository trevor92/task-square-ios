import SwiftUI
import SwiftData

struct ViewEditTaskView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss

    let task: Task

    @State private var title: String
    @State private var detail: String
    @State private var isCompleted: Bool
    @State private var showingDeleteConfirmation = false
    @State private var saveError: Error?

    init(task: Task) {
        self.task = task
        _title = State(initialValue: task.title)
        _detail = State(initialValue: task.detail)
        _isCompleted = State(initialValue: task.isCompleted)
    }

    var body: some View {
        NavigationStack {
            Form {
                Section("Task Details") {
                    TextField("Title", text: $title)
                    TextField("Description (optional)", text: $detail, axis: .vertical)
                        .lineLimit(3...6)
                }

                Section {
                    Toggle("Completed", isOn: $isCompleted)
                }

                Section {
                    Button("Delete Task", role: .destructive) {
                        showingDeleteConfirmation = true
                    }
                }
            }
            .navigationTitle("Edit Task")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        saveChanges()
                    }
                    .disabled(title.trimmingCharacters(in: .whitespaces).isEmpty)
                }
            }
            .confirmationDialog(
                "Delete Task",
                isPresented: $showingDeleteConfirmation,
                titleVisibility: .visible
            ) {
                Button("Delete", role: .destructive) {
                    deleteTask()
                }
            } message: {
                Text("Are you sure you want to delete \"\(title.trimmingCharacters(in: .whitespaces))\"?")
            }
            .alert("Save Failed", isPresented: Binding(
                get: { saveError != nil },
                set: { if !$0 { saveError = nil } }
            )) {
                Button("OK", role: .cancel) { saveError = nil }
            } message: {
                Text(saveError?.localizedDescription ?? "")
            }
        }
    }

    private func saveChanges() {
        task.title = title.trimmingCharacters(in: .whitespaces)
        task.detail = detail.trimmingCharacters(in: .whitespaces)
        task.isCompleted = isCompleted
        do {
            try modelContext.save()
            dismiss()
        } catch {
            saveError = error
        }
    }

    private func deleteTask() {
        modelContext.delete(task)
        dismiss()
    }
}
