//
//  RealmMappers.swift
//  LifeBoard
//
//  Created by 金融產規部財工組-鄭勝文 on 2025/12/2.
//

import Foundation
import RealmSwift

// MARK: - Task
extension TaskItem {
    static func from(_ obj: TaskObject) -> TaskItem {
        TaskItem(id: obj.id,
                 title: obj.title,
                 note: obj.note,
                 dueDate: obj.dueDate,
                 isCompleted: obj.isCompleted)
    }
}

extension TaskObject {
    /// 建立新物件時用（會寫入 id）
    func fillForCreate(from model: TaskItem) {
        self.id = model.id                  // ✅ 新增時可以設定 primary key
        self.title = model.title
        self.note = model.note
        self.dueDate = model.dueDate
        self.isCompleted = model.isCompleted
    }
    
    /// 更新既有物件時用（**不要動 id**）
    func fillForUpdate(from model: TaskItem) {
        // self.id = model.id               // ❌ 千萬不要動它
        self.title = model.title
        self.note = model.note
        self.dueDate = model.dueDate
        self.isCompleted = model.isCompleted
    }
}

// MARK: - Habit
extension HabitItem {
    static func from(_ obj: HabitObject) -> HabitItem {
        HabitItem(id: obj.id,
                  name: obj.name,
                  dates: Array(obj.dates))
    }
}

extension HabitObject {
    /// 建立新物件時用（會寫入 id）
    func fillForCreate(from model: HabitItem) {
        self.id = model.id                  // ✅ 新增時可以設定 primary key
        self.name = model.name
        self.dates.removeAll()
        self.dates.append(objectsIn: model.dates)
    }
    
    /// 更新既有物件時用（**不要動 id**）
    func fillForUpdate(from model: HabitItem) {
        // self.id = model.id               // ❌ 千萬不要動它
        self.name = model.name
        self.dates.removeAll()
        self.dates.append(objectsIn: model.dates)
    }
}

// MARK: - Note
extension NoteItem {
    static func from(_ obj: NoteObject) -> NoteItem {
        NoteItem(id: obj.id,
                 title: obj.title,
                 content: obj.content,
                 createdAt: obj.createdAt)
    }
}

extension NoteObject {
    /// 建立新物件時用（會寫入 id）
    func fillForCreate(from model: NoteItem) {
        self.id = model.id                  // ✅ 新增時可以設定 primary key
        self.title = model.title
        self.content = model.content
        self.createdAt = model.createdAt
    }
    
    /// 更新既有物件時用（**不要動 id**）
    func fillForUpdate(from model: NoteItem) {
        // self.id = model.id               // ❌ 千萬不要動它
        self.title = model.title
        self.content = model.content
        self.createdAt = model.createdAt
    }
}
