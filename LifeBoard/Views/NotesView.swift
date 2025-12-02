//
//  NotesView.swift
//  LifeBoard
//
//  Created by 金融產規部財工組-鄭勝文 on 2025/12/1.
//

import SwiftUI

struct NotesView: View {
    @ObservedObject var viewModel: NotesViewModel
    @State private var showAdd = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.filteredNotes) { note in
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
                }
                .onDelete(perform: viewModel.delete)
            }
            .searchable(text: $viewModel.searchText)
            .navigationTitle("筆記")
            .toolbar {
                Button {
                    showAdd = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showAdd) {
                AddNoteView { title, content in
                    viewModel.addNote(title: title, content: content)
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
                TextField("標題", text: $title)
                TextEditor(text: $content)
                    .frame(height: 200)
            }
            .navigationTitle("新增筆記")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("取消") { dismiss() }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("儲存") {
                        guard !title.isEmpty else { return }
                        onSave(title, content)
                        dismiss()
                    }
                }
            }
        }
    }
}
