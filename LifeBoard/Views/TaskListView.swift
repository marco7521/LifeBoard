//
//  TaskListView.swift
//  LifeBoard
//
//  Created by 金融產規部財工組-鄭勝文 on 2025/12/1.
//

import SwiftUI

struct TaskListView: View {
    @ObservedObject var viewModel: TaskListViewModel
    @State private var showAdd = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.tasks) { task in
                    HStack {
                        Button {
                            viewModel.toggleTaskCompletion(task)
                        } label: {
                            Image(systemName: task.isCompleted
                                  ? "checkmark.circle.fill"
                                  : "circle")
                            .foregroundColor(task.isCompleted ? .green : .gray)
                        }
                        .buttonStyle(.plain)
                        
                        VStack(alignment: .leading) {
                            Text(task.title)
                                .strikethrough(task.isCompleted, color: .gray)
                            Text(task.dueDate, style: .date)
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                    }
                }
                .onDelete(perform: viewModel.delete)
            }
            .navigationTitle("待辦")
            .toolbar {
                Button {
                    showAdd = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showAdd) {
                AddTaskView { title, note, date in
                    viewModel.addTask(title: title,
                                      note: note,
                                      dueDate: date)
                }
            }
        }
    }
}

struct AddTaskView: View {
    @Environment(\.dismiss) var dismiss
    
    @State private var title: String = ""
    @State private var note: String = ""
    @State private var dueDate: Date = Date()
    
    var onSave: (_ title: String, _ note: String?, _ dueDate: Date) -> Void
    
    var body: some View {
        NavigationStack {
            Form {
                Section("基本資訊") {
                    TextField("標題", text: $title)
                    TextField("備註（可選）", text: $note)
                }
                
                Section("時間") {
                    DatePicker("到期時間",
                               selection: $dueDate,
                               displayedComponents: .date)
                }
            }
            .navigationTitle("新增任務")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("取消") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("儲存") {
                        guard !title.isEmpty else { return }
                        onSave(title, note.isEmpty ? nil : note, dueDate)
                        dismiss()
                    }
                }
            }
        }
    }
}
