//
//  AppViewModel.swift
//  LifeBoard
//
//  Created by 金融產規部財工組-鄭勝文 on 2025/12/1.
//

import Foundation
import Combine

final class AppViewModel: ObservableObject {
    @Published var taskViewModel: TaskListViewModel
    @Published var habitViewModel: HabitViewModel
    @Published var notesViewModel: NotesViewModel
    @Published var settingsViewModel: SettingsViewModel
    
    init() {
        // 這裡可以改成從磁碟 / Realm 載入
        self.taskViewModel = TaskListViewModel()
        self.habitViewModel = HabitViewModel()
        self.notesViewModel = NotesViewModel()
        self.settingsViewModel = SettingsViewModel()
        
        // 範例假資料
        seedSampleData()
    }
    
    private func seedSampleData() {
        taskViewModel.tasks = [
            TaskItem(title: "寫 SwiftUI", dueDate: Date()),
            TaskItem(title: "運動 30 分鐘", dueDate: Date().addingTimeInterval(86400)),
            TaskItem(title: "研究 Realm + SwiftUI", dueDate: Date().addingTimeInterval(2 * 86400))
        ]
        
        habitViewModel.habits = [
            HabitItem(name: "運動"),
            HabitItem(name: "喝水"),
            HabitItem(name: "寫程式")
        ]
        
        notesViewModel.notes = [
            NoteItem(title: "SwiftUI MVVM 筆記",
                     content: "把 State 從 View 抽到 ViewModel，View 專心畫畫面。")
        ]
    }
}
