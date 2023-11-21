//
//  AddMemoView.swift
//  PicMemo
//
//  Created by Uriel Ortega on 28/06/23.
//

import SwiftUI

struct AddMemoView: View {
    @StateObject private var viewModel: ViewModel
    
    @State private var showingImagePicker = false
        
    @Environment(\.dismiss) var dismiss
    var onSave: (Memo) -> Void // Function used when saving memo.
    
    var body: some View {
        NavigationStack {
            VStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(.ultraThinMaterial)
                    
                    if viewModel.memoImage == nil {
                        Text("Tap to select a picture")
                            .foregroundColor(.secondary)
                            .font(.headline)
                    }
                    
                    viewModel.memoImage?
                        .resizable()
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                        .scaledToFit()
                        .padding(10)
                }
                .padding()
                .onTapGesture {
                    showingImagePicker = true
                    
                    viewModel.trackLocation()
                }
                // Accessibility modifiers:
                .accessibilityElement()
                .accessibilityLabel("Tap to select a picture")
                .accessibilityAddTraits(.isButton)
                
                Form {
                    Section("Set a description") {
                        TextField("Happy moment...", text: $viewModel.memoDescription)
                    }
                }
            }
            .onChange(of: viewModel.inputImage) { _ in viewModel.loadImage() }
            .sheet(isPresented: $showingImagePicker) {
                ImagePicker(image: $viewModel.inputImage)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                        let newMemo = viewModel.createNewMemo()
                        
                        onSave(newMemo)
                        
                        dismiss()
                    }
                }
            }
        }
    }
    
    init(memo: Memo, onSave: @escaping (Memo) -> Void) {
        self.onSave = onSave
        _viewModel = StateObject(wrappedValue: ViewModel(memo: memo))
    }
}

struct AddMemoView_Previews: PreviewProvider {
    static var previews: some View {
        AddMemoView(memo: Memo.example) { _ in }
    }
}
