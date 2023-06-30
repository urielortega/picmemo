//
//  AddMemoView-ViewModel.swift
//  PicMemo
//
//  Created by Uriel Ortega on 29/06/23.
//

import Foundation
import SwiftUI
import UIKit

extension AddMemoView {
    @MainActor class ViewModel: ObservableObject {
        @Published var memos: [Memo] // Array for appending memos.
        
        @Published var memo: Memo

        @Published var inputImage: UIImage?
        @Published var memoImage: Image?
        @Published var memoDescription: String

        let savePath = FileManager.documentsDirectory.appendingPathComponent("SavedMemos")
        
        init(memo: Memo) {
            memoDescription = memo.description
            self.memo = memo
            
            // For loading data.
            do {
                let data = try Data(contentsOf: savePath)
                memos = try JSONDecoder().decode([Memo].self, from: data).sorted() // memos alphabetically sorted.
            } catch {
                memos = []
            }
        }
        
        func createNewMemo() -> Memo {
            var newMemo = memo
            
            newMemo.id = UUID()
            newMemo.imageData = (inputImage?.jpegData(compressionQuality: 0.8))
            newMemo.description = memoDescription
            
            return newMemo
        }
        
        func loadImage() {
            guard let inputImage = inputImage else { return }
            
            memoImage = Image(uiImage: inputImage)
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
