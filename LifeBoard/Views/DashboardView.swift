//
//  DashboardView.swift
//  LifeBoard
//
//  Created by 金融產規部財工組-鄭勝文 on 2025/12/1.
//

import SwiftUI

struct DashboardView: View {
    let taskVM: TaskListViewModel
    let habitVM: HabitViewModel
    let notesVM: NotesViewModel
    
    private let columns = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 16) {
                    DashboardCard(title: "今日任務",
                                  icon: "checkmark.circle",
                                  value: "\(taskVM.todayTasks.count) 項")
                    
                    DashboardCard(title: "今日完成習慣",
                                  icon: "flame.fill",
                                  value: "\(habitVM.completionCountToday()) 個")
                    
                    DashboardCard(title: "筆記數量",
                                  icon: "note.text",
                                  value: "\(notesVM.notes.count) 則")
                }
                .padding()
            }
            .navigationTitle("LifeBoard")
        }
    }
}

struct DashboardCard: View {
    let title: String
    let icon: String
    let value: String
    
    var body: some View {
        VStack(spacing: 8) {
            HStack {
                Image(systemName: icon)
                    .font(.title2)
                Spacer()
            }
            
//            Spacer()
            
            Text(title)
                .font(.headline)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Text(value)
                .font(.title)
                .bold()
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding()
        .frame(height: 120)
        .background(.blue.opacity(0.85))
        .foregroundColor(.white)
        .cornerRadius(16)
    }
}
