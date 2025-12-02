//
//  HabitView.swift
//  LifeBoard
//
//  Created by 金融產規部財工組-鄭勝文 on 2025/12/1.
//

// HabitView.swift
import SwiftUI

struct HabitView: View {
    @ObservedObject var viewModel: HabitViewModel
    
    @State private var showAddAlert = false
    @State private var newHabitName: String = ""
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.habits) { habit in
                    HStack {
                        VStack(alignment: .leading, spacing: 4) {
                            Text(habit.name)
                                .font(.headline)
                            
                            Text("累積打卡：\(habit.dates.count) 天")
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                        
                        Spacer()
                        
                        Button {
                            viewModel.markToday(habit)
                        } label: {
                            Image(systemName: "checkmark.circle")
                        }
                        .buttonStyle(.borderless)
                    }
                }
                .onDelete(perform: viewModel.delete)
            }
            .navigationTitle("習慣")
            .toolbar {
                Button {
                    showAddAlert = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .alert("新增習慣", isPresented: $showAddAlert) {
                TextField("習慣名稱", text: $newHabitName)
                Button("新增") {
                    let trimmed = newHabitName.trimmingCharacters(in: .whitespacesAndNewlines)
                    guard !trimmed.isEmpty else { return }
                    viewModel.addHabit(name: trimmed)
                    newHabitName = ""
                }
                Button("取消", role: .cancel) { }
            } message: {
                Text("例如：運動、喝水、寫程式...")
            }
        }
    }
}
