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
    
    // MARK: - CRUD
    
    func addTask(title: String,
                 note: String? = nil,
                 dueDate: Date) {
        let item = TaskItem(title: title,
                            note: note,
                            dueDate: dueDate)
        tasks.append(item)
    }
    
    func updateTask(_ task: TaskItem,
                    title: String,
                    note: String?,
                    dueDate: Date,
                    isCompleted: Bool) {
        guard let index = tasks.firstIndex(of: task) else { return }
        tasks[index].title = title
        tasks[index].note = note
        tasks[index].dueDate = dueDate
        tasks[index].isCompleted = isCompleted
    }
    
    func toggleTaskCompletion(_ task: TaskItem) {
        guard let index = tasks.firstIndex(of: task) else { return }
        tasks[index].isCompleted.toggle()
    }
    
    func delete(at offsets: IndexSet) {
        tasks.remove(atOffsets: offsets)
    }
    
    // 方便 Dashboard 用
    var todayTasks: [TaskItem] {
        let calendar = Calendar.current
        return tasks.filter {
            calendar.isDateInToday($0.dueDate)
        }
    }
    
    var completedTodayCount: Int {
        todayTasks.filter { $0.isCompleted }.count
    }
}
