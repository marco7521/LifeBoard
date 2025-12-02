//
//  HabitViewModel.swift
//  LifeBoard
//
//  Created by 金融產規部財工組-鄭勝文 on 2025/12/1.
//

import Foundation
import Combine
import SwiftUI

final class HabitViewModel: ObservableObject {
    @Published var habits: [HabitItem] = []
    private let repo: HabitRepository
    
    init(repo: HabitRepository = RealmHabitRepository()) {
        self.repo = repo
        load()
    }
    
    func load() {
        habits = repo.fetch()
    }
    
    func addHabit(name: String) {
        repo.add(HabitItem(name: name))
        load()
    }
    
    func markToday(_ habit: HabitItem) {
        var updated = habit
        let today = Calendar.current.startOfDay(for: Date())
        
        if !updated.dates.contains(where: {
            Calendar.current.isDate($0, inSameDayAs: today)
        }) {
            updated.dates.append(today)
            repo.update(updated)
            load()
        }
    }
    
    func delete(at offsets: IndexSet) {
        offsets.forEach { repo.delete(habits[$0]) }
        load()
    }
    
    func todaysCount() -> Int {
        let today = Calendar.current.startOfDay(for: Date())
        
        return habits.filter { habit in
            habit.dates.contains { Calendar.current.isDate($0, inSameDayAs: today) }
        }.count
    }
}
