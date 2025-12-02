//
//  NoteObject.swift
//  LifeBoard
//
//  Created by 金融產規部財工組-鄭勝文 on 2025/12/2.
//

import Foundation
import RealmSwift

class NoteObject: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var id: String
    @Persisted var title: String = ""
    @Persisted var content: String = ""
    @Persisted var createdAt: Date = Date()
}
