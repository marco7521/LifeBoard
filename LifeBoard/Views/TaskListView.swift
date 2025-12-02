//
//  TaskListView.swift
//  LifeBoard
//
//  Created by 金融產規部財工組-鄭勝文 on 2025/12/1.
//

import SwiftUI

struct TaskListView: View {
    @ObservedObject var viewModel: TaskListViewModel
    @State private var showAddSheet = false
    
    var body: some View {
        NavigationStack {
            Group {
                if viewModel.tasks.isEmpty {
                    VStack(spacing: 12) {
                        Image(systemName: "checklist")
                            .font(.system(size: 40))
                            .foregroundColor(.secondary)
                        Text("目前還沒有待辦事項")
                            .font(.headline)
                            .foregroundColor(.secondary)
                        Text("點右上角「＋」新增一個任務吧！")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                } else {
                    List {
                        ForEach(viewModel.tasks) { task in
                            HStack {
                                Button {
                                    viewModel.toggle(task)
                                } label: {
                                    Image(systemName: task.isCompleted
                                          ? "checkmark.circle.fill"
                                          : "circle")
                                        .foregroundColor(task.isCompleted ? .green : .gray)
                                        .font(.title3)
                                }
                                .buttonStyle(.plain)
                                
                                VStack(alignment: .leading, spacing: 4) {
                                    Text(task.title)
                                        .font(.body)
                                        .strikethrough(task.isCompleted, color: .gray)
                                    
                                    HStack(spacing: 4) {
                                        Image(systemName: "calendar")
                                        Text(task.dueDate, style: .date)
                                    }
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                                    
                                    if let note = task.note, !note.isEmpty {
                                        Text(note)
                                            .font(.caption)
                                            .foregroundColor(.secondary)
                                            .lineLimit(1)
                                    }
                                }
                            }
                            .padding(.vertical, 4)
                        }
                        .onDelete(perform: viewModel.delete)
                    }
                }
            }
            .navigationTitle("待辦")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showAddSheet = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $showAddSheet) {
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
                    TextField("標題（必填）", text: $title)
                    
                    TextField("備註（選填）", text: $note, axis: .vertical)
                        .lineLimit(1...3)
                }
                
                Section("時間") {
                    DatePicker("到期日",
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
                        let trimmedTitle = title.trimmingCharacters(in: .whitespacesAndNewlines)
                        guard !trimmedTitle.isEmpty else { return }
                        
                        let trimmedNote = note.trimmingCharacters(in: .whitespacesAndNewlines)
                        onSave(trimmedTitle,
                               trimmedNote.isEmpty ? nil : trimmedNote,
                               dueDate)
                        dismiss()
                    }
                }
            }
        }
    }
}
