# TaskSquare iOS

A task/to-do app for iOS, mirroring the [TaskSquare Android app](https://github.com/trevor92/task-square-android/tree/v1).

## Requirements

- Xcode 15+
- iOS 17+

## Features

- **Task list** — view all tasks with completion status indicator; swipe to delete; empty-state placeholder
- **Add task** — create a new task with a title and optional description
- **Edit task** — update the title, description, or completion status; delete the task
- **Local persistence** — tasks are stored on-device using SwiftData (backed by SQLite)

## Tech Stack

| Concern | Choice |
|---------|--------|
| Language | Swift 5 |
| UI | SwiftUI |
| Local DB | SwiftData (iOS 17+) |
| Architecture | single-target, view-centric |

## Project Structure

```
TaskSquare.xcodeproj/        Xcode project
TaskSquare/
  TaskSquareApp.swift        App entry point; configures SwiftData model container
  Task.swift                 @Model: title, detail, isCompleted, createdAt
  TaskListView.swift         Main screen — list of tasks with add / edit / delete
  AddTaskView.swift          Sheet — create a new task
  ViewEditTaskView.swift     Sheet — view, edit, or delete an existing task
  Assets.xcassets/           App icon and accent colour assets
```

## Getting Started

1. Open `TaskSquare.xcodeproj` in Xcode 15 or later.
2. Select an iPhone simulator running iOS 17+.
3. Build and run (`⌘R`).
