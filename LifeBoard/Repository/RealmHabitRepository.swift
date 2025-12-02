//
//  RealmHabitRepository.swift
//  LifeBoard
//
//  Created by 金融產規部財工組-鄭勝文 on 2025/12/2.
//

import Foundation
import RealmSwift

final class RealmHabitRepository: HabitRepository {
    private let realm = try! Realm()
    
    func fetch() -> [HabitItem] {
        realm.objects(HabitObject.self)
            .map(HabitItem.from)
    }
    
    func add(_ item: HabitItem) {
        let obj = HabitObject()
        obj.fillForCreate(from: item)
        try! realm.write { realm.add(obj) }
    }
    
    func update(_ item: HabitItem) {
        guard let obj = realm.object(ofType: HabitObject.self, forPrimaryKey: item.id) else { return }
        try! realm.write { obj.fillForUpdate(from: item) }
    }
    
    func delete(_ item: HabitItem) {
        guard let obj = realm.object(ofType: HabitObject.self, forPrimaryKey: item.id) else { return }
        try! realm.write { realm.delete(obj) }
    }
}
