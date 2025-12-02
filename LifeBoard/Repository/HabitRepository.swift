//
//  HabitRepository.swift
//  LifeBoard
//
//  Created by 金融產規部財工組-鄭勝文 on 2025/12/2.
//

import Foundation

protocol HabitRepository {
    func fetch() -> [HabitItem]
    func add(_ item: HabitItem)
    func update(_ item: HabitItem)
    func delete(_ item: HabitItem)
}
