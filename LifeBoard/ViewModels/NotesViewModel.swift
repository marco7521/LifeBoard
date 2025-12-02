//
//  NotesViewModel.swift
//  LifeBoard
//
//  Created by 金融產規部財工組-鄭勝文 on 2025/12/1.
//

import Foundation
import Combine
import SwiftUI

final class NotesViewModel: ObservableObject {
    @Published var notes: [NoteItem] = []
    @Published var searchText: String = ""
    
    var filteredNotes: [NoteItem] {
        guard !searchText.isEmpty else { return notes }
        return notes.filter {
            $0.title.localizedCaseInsensitiveContains(searchText) ||
            $0.content.localizedCaseInsensitiveContains(searchText)
        }
    }
    
    func addNote(title: String, content: String) {
        let note = NoteItem(title: title, content: content)
        notes.append(note)
    }
    
    func delete(at offsets: IndexSet) {
        notes.remove(atOffsets: offsets)
    }
}
