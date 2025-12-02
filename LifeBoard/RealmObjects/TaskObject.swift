//
//  TaskObject.swift
//  LifeBoard
//
//  Created by 金融產規部財工組-鄭勝文 on 2025/12/2.
//

import Foundation
import RealmSwift

class TaskObject: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var id: String
    @Persisted var title: String = ""
    @Persisted var note: String?
    @Persisted var dueDate: Date = Date()
    @Persisted var isCompleted: Bool = false
}
