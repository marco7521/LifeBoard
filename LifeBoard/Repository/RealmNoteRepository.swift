//
//  RealmNoteRepository.swift
//  LifeBoard
//
//  Created by 金融產規部財工組-鄭勝文 on 2025/12/2.
//

import Foundation
import RealmSwift

final class RealmNoteRepository: NoteRepository {
    private let realm = try! Realm()
    
    func fetch() -> [NoteItem] {
        realm.objects(NoteObject.self)
            .map(NoteItem.from)
    }
    
    func add(_ item: NoteItem) {
        let obj = NoteObject()
        obj.fillForCreate(from: item)
        try! realm.write { realm.add(obj) }
    }
    
    func update(_ item: NoteItem) {
        guard let obj = realm.object(ofType: NoteObject.self, forPrimaryKey: item.id) else { return }
        try! realm.write { obj.fillForUpdate(from: item) }
    }
    
    func delete(_ item: NoteItem) {
        guard let obj = realm.object(ofType: NoteObject.self, forPrimaryKey: item.id) else { return }
        try! realm.write { realm.delete(obj) }
    }
}
