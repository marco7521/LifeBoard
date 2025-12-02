//
//  NoteRepository.swift
//  LifeBoard
//
//  Created by 金融產規部財工組-鄭勝文 on 2025/12/2.
//

import Foundation

protocol NoteRepository {
    func fetch() -> [NoteItem]
    func add(_ item: NoteItem)
    func update(_ item: NoteItem)
    func delete(_ item: NoteItem)
}
