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
    
    func addHabit(name: String) {
        habits.append(HabitItem(name: name))
    }
    
    func delete(at offsets: IndexSet) {
        habits.remove(atOffsets: offsets)
    }
    
    func markToday(for habit: HabitItem) {
        guard let index = habits.firstIndex(of: habit) else { return }
        let today = Calendar.current.startOfDay(for: Date())
        if !habits[index].dates.contains(where: { Calendar.current.isDate($0, inSameDayAs: today) }) {
            habits[index].dates.append(today)
        }
    }
    
    func completionCountToday() -> Int {
        let today = Calendar.current.startOfDay(for: Date())
        return habits.reduce(0) { partial, habit in
            let hit = habit.dates.contains { date in
                Calendar.current.isDate(date, inSameDayAs: today)
            }
            return partial + (hit ? 1 : 0)
        }
    }
}
