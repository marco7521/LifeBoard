//
//  RealmTaskRepository.swift
//  LifeBoard
//
//  Created by 金融產規部財工組-鄭勝文 on 2025/12/2.
//

import Foundation
import RealmSwift

final class RealmTaskRepository: TaskRepository {
    private let realm = try! Realm()
    
    func fetch() -> [TaskItem] {
        realm.objects(TaskObject.self)
            .map(TaskItem.from)
    }
    
    func add(_ item: TaskItem) {
        let obj = TaskObject()
        obj.fillForCreate(from: item)
        try! realm.write {
            realm.add(obj)
        }
    }
    
    func update(_ item: TaskItem) {
        guard let obj = realm.object(ofType: TaskObject.self, forPrimaryKey: item.id) else { return }
        try! realm.write {
            obj.fillForUpdate(from: item)
        }
    }
    
    func delete(_ item: TaskItem) {
        guard let obj = realm.object(ofType: TaskObject.self, forPrimaryKey: item.id) else { return }
        try! realm.write { realm.delete(obj) }
    }
}
