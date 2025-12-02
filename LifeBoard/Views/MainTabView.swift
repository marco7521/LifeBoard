//
//  MainTabView.swift
//  LifeBoard
//
//  Created by 金融產規部財工組-鄭勝文 on 2025/12/1.
//

import SwiftUI

struct MainTabView: View {
    @EnvironmentObject var app: AppViewModel
    
    var body: some View {
        TabView {
            
            DashboardView(tasks: app.tasks,
                          habits: app.habits,
                          notes: app.notes)
            .tabItem {
                Label("Dashboard", systemImage: "square.grid.2x2")
            }
            
            TaskListView(viewModel: app.tasks)
                .tabItem {
                    Label("待辦", systemImage: "checklist")
                }
            
            HabitView(viewModel: app.habits)
                .tabItem {
                    Label("習慣", systemImage: "calendar")
                }
            
            NotesView(viewModel: app.notes)
                .tabItem {
                    Label("筆記", systemImage: "note.text")
                }
            
            SettingsView(viewModel: app.settings)
                .tabItem {
                    Label("設定", systemImage: "gear")
                }
        }
    }
}

#Preview {
    MainTabView()
}
