//
//  NoteItem.swift
//  LifeBoard
//
//  Created by 金融產規部財工組-鄭勝文 on 2025/12/1.
//

import Foundation

struct NoteItem: Identifiable, Equatable {
    let id: String
    var title: String
    var content: String
    var createdAt: Date
    
    init(id: String = UUID().uuidString,
         title: String,
         content: String,
         createdAt: Date = Date()) {
        self.id = id
        self.title = title
        self.content = content
        self.createdAt = createdAt
    }
}
