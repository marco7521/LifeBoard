//
//  MainTabView.swift
//  LifeBoard
//
//  Created by 金融產規部財工組-鄭勝文 on 2025/12/1.
//

import SwiftUI

struct MainTabView: View {
    @EnvironmentObject var appVM: AppViewModel
    
    var body: some View {
        TabView {
            DashboardView(taskVM: appVM.taskViewModel,
                          habitVM: appVM.habitViewModel,
                          notesVM: appVM.notesViewModel)
                .tabItem {
                    Label("Dashboard", systemImage: "square.grid.2x2")
                }
            
            TaskListView(viewModel: appVM.taskViewModel)
                .tabItem {
                    Label("待辦", systemImage: "checklist")
                }
            
            HabitView(viewModel: appVM.habitViewModel)
                .tabItem {
                    Label("習慣", systemImage: "calendar")
                }
            
            NotesView(viewModel: appVM.notesViewModel)
                .tabItem {
                    Label("筆記", systemImage: "note.text")
                }
            
            SettingsView(viewModel: appVM.settingsViewModel)
                .tabItem {
                    Label("設定", systemImage: "gear")
                }
        }
    }
}

#Preview {
    MainTabView()
}
