//
//  NotesView.swift
//  LifeBoard
//
//  Created by 金融產規部財工組-鄭勝文 on 2025/12/1.
//

import SwiftUI

struct NotesView: View {
    @ObservedObject var viewModel: NotesViewModel
    @State private var showAddSheet = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.filtered) { note in
                    VStack(alignment: .leading, spacing: 4) {
                        Text(note.title)
                            .font(.headline)
                        
                        Text(note.content)
                            .lineLimit(1)
                            .foregroundColor(.secondary)
                        
                        Text(note.createdAt, style: .date)
                            .font(.caption2)
                            .foregroundColor(.gray)
                    }
                    .padding(.vertical, 4)
                }
                .onDelete(perform: viewModel.delete)
            }
            .searchable(text: $viewModel.search)
            .navigationTitle("筆記")
            .toolbar {
                Button {
                    showAddSheet = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showAddSheet) {
                AddNoteView { title, content in
                    viewModel.add(title: title, content: content)
                }
            }
        }
    }
}

struct AddNoteView: View {
    @Environment(\.dismiss) var dismiss
    
    @State private var title: String = ""
    @State private var content: String = ""
    
    var onSave: (_ title: String, _ content: String) -> Void
    
    var body: some View {
        NavigationStack {
            Form {
                Section("標題") {
                    TextField("請輸入標題", text: $title)
                }
                
                Section("內容") {
                    TextEditor(text: $content)
                        .frame(minHeight: 200)
                }
            }
            .navigationTitle("新增筆記")
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
                        onSave(trimmedTitle, content)
                        dismiss()
                    }
                }
            }
        }
    }
}
