//
//  HabitItem.swift
//  LifeBoard
//
//  Created by 金融產規部財工組-鄭勝文 on 2025/12/1.
//

import Foundation

struct HabitItem: Identifiable, Equatable {
    let id: String
    var name: String
    /// 打卡日期
    var dates: [Date]
    
    init(id: String = UUID().uuidString,
         name: String,
         dates: [Date] = []) {
        self.id = id
        self.name = name
        self.dates = dates
    }
}
