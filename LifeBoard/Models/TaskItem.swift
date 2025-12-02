//
//  TaskItem.swift
//  LifeBoard
//
//  Created by 金融產規部財工組-鄭勝文 on 2025/12/1.
//

import Foundation

struct TaskItem: Identifiable, Codable, Equatable {
    let id: UUID
    var title: String
    var note: String?
    var dueDate: Date
    var isCompleted: Bool
    
    init(id: UUID = UUID(),
         title: String,
         note: String? = nil,
         dueDate: Date,
         isCompleted: Bool = false) {
        self.id = id
        self.title = title
        self.note = note
        self.dueDate = dueDate
        self.isCompleted = isCompleted
    }
}
