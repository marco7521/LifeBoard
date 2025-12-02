//
//  DashboardView.swift
//  LifeBoard
//
//  Created by 金融產規部財工組-鄭勝文 on 2025/12/1.
//

import SwiftUI

struct DashboardView: View {
    @ObservedObject var tasks: TaskListViewModel
    @ObservedObject var habits: HabitViewModel
    @ObservedObject var notes: NotesViewModel

    private let columns = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 16) {
                    DashboardCard(
                        title: "今日任務",
                        icon: "checkmark.circle",
                        value: "\(tasks.todayTasks.count)"
                    )
                    
                    DashboardCard(
                        title: "已完成習慣",
                        icon: "flame.fill",
                        value: "\(habits.todaysCount())"
                    )
                    
                    DashboardCard(
                        title: "筆記總數",
                        icon: "note.text",
                        value: "\(notes.notes.count)"
                    )
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
