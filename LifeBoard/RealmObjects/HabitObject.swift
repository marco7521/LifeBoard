//
//  HabitObject.swift
//  LifeBoard
//
//  Created by 金融產規部財工組-鄭勝文 on 2025/12/2.
//

import Foundation
import RealmSwift

class HabitObject: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var id: String
    @Persisted var name: String = ""
    @Persisted var dates: List<Date>
}
