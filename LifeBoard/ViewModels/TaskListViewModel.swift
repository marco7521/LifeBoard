//
//  TaskListViewModel.swift
//  LifeBoard
//
//  Created by 金融產規部財工組-鄭勝文 on 2025/12/1.
//

import Foundation
import Combine
import SwiftUI

final class TaskListViewModel: ObservableObject {
    @Published var tasks: [TaskItem] = []
    private let repo: TaskRepository
    
    init(repo: TaskRepository = RealmTaskRepository()) {
        self.repo = repo
        load()
    }
    
    func load() {
        tasks = repo.fetch()
    }
    
    func addTask(title: String, note: String?, dueDate: Date) {
        repo.add(TaskItem(title: title, note: note, dueDate: dueDate))
        load()
    }
    
    func toggle(_ task: TaskItem) {
        var updated = task
        updated.isCompleted.toggle()
        repo.update(updated)
        load()
    }
    
    func delete(at offsets: IndexSet) {
        for i in offsets { repo.delete(tasks[i]) }
        load()
    }
    
    var todayTasks: [TaskItem] {
        let cal = Calendar.current
        return tasks.filter { cal.isDateInToday($0.dueDate) }
    }
    
    var completedTodayCount: Int {
        todayTasks.filter { $0.isCompleted }.count
    }
}
