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
                memos = try JSONDecoder().decode([Memo].self, from: data)
            } catch {
                memos = []
            }
        }
    }
}
