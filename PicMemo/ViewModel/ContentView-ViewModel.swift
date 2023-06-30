//
//  ContentView-ViewModel.swift
//  PicMemo
//
//  Created by Uriel Ortega on 29/06/23.
//

import Foundation
import UIKit

extension ContentView {
    @MainActor class ViewModel: ObservableObject {
        @Published var memos: [Memo] // Array for displaying memos in ContentView

        let savePath = FileManager.documentsDirectory.appendingPathComponent("SavedMemos")
        
        init() { // For loading data.
            do {
                let data = try Data(contentsOf: savePath)
                memos = try JSONDecoder().decode([Memo].self, from: data).sorted() // memos alphabetically sorted.
            } catch {
                memos = []
            }
        }
        
        func updateMemos(with memo: Memo) { // Activated when Save button is pressed.
            memos.append(memo)
            save()
        }
        
        func save() {
            do {
                let data = try JSONEncoder().encode(memos)
                try data.write(to: savePath, options: [.atomic, .completeFileProtection])
            } catch {
                print("Unable to save data.")
            }
        }
    }
}
