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
    @Published var search = ""
    
    private let repo: NoteRepository
    
    init(repo: NoteRepository = RealmNoteRepository()) {
        self.repo = repo
        load()
    }
    
    func load() {
        notes = repo.fetch()
    }
    
    var filtered: [NoteItem] {
        if search.isEmpty { return notes }
        return notes.filter {
            $0.title.localizedCaseInsensitiveContains(search) ||
            $0.content.localizedCaseInsensitiveContains(search)
        }
    }
    
    func add(title: String, content: String) {
        repo.add(NoteItem(title: title, content: content))
        load()
    }
    
    func delete(at offsets: IndexSet) {
        for i in offsets { repo.delete(notes[i]) }
        load()
    }
}
