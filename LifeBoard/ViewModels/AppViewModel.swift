//
//  AppViewModel.swift
//  LifeBoard
//
//  Created by 金融產規部財工組-鄭勝文 on 2025/12/1.
//

import Foundation
import Combine

final class AppViewModel: ObservableObject {
    @Published var tasks = TaskListViewModel()
    @Published var habits = HabitViewModel()
    @Published var notes = NotesViewModel()
    @Published var settings = SettingsViewModel()
}
