//
//  AddMemoView-ViewModel.swift
//  PicMemo
//
//  Created by Uriel Ortega on 29/06/23.
//

import Foundation
import UIKit

extension AddMemoView {
    @MainActor class ViewModel: ObservableObject {
        @Published var memos: [Memo] // Array for appending memos.

        let savePath = FileManager.documentsDirectory.appendingPathComponent("SavedMemos")
        
        func save() {
            do {
                let data = try JSONEncoder().encode(memos)
                try data.write(to: savePath, options: [.atomic, .completeFileProtection])
            } catch {
                print("Unable to save data.")
            }
        }
        
        init() { // For loading data.
            do {
                let data = try Data(contentsOf: savePath)
                memos = try JSONDecoder().decode([Memo].self, from: data)
            } catch {
                memos = []
            }
        }
    }
}
