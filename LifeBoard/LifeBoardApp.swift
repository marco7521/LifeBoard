//
//  LifeBoardApp.swift
//  LifeBoard
//
//  Created by 金融產規部財工組-鄭勝文 on 2025/12/1.
//

import SwiftUI

@main
struct LifeBoardApp: App {
    @StateObject var app = AppViewModel()

    var body: some Scene {
        WindowGroup {
            MainTabView()
                .environmentObject(app)
        }
    }
}
