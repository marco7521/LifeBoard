//
//  TaskRepository.swift
//  LifeBoard
//
//  Created by 金融產規部財工組-鄭勝文 on 2025/12/2.
//

import Foundation

protocol TaskRepository {
    func fetch() -> [TaskItem]
    func add(_ item: TaskItem)
    func update(_ item: TaskItem)
    func delete(_ item: TaskItem)
}
