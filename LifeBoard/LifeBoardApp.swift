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
    // 用 AppStorage 記住使用者選擇的主題
    @AppStorage("isDarkMode") private var isDarkMode: Bool = false
    
    var body: some Scene {
        WindowGroup {
            MainTabView()
                .environmentObject(app)
                // 這裡決定整個 App 要用深色還是淺色
                .preferredColorScheme(isDarkMode ? .dark : .light)
        }
    }
}
