//
//  AddMemoView.swift
//  PicMemo
//
//  Created by Uriel Ortega on 28/06/23.
//

import SwiftUI

struct AddMemoView: View {
    @State private var memoImage: Image?
    @State private var memoDescription: String = ""
    
    @State private var showingImagePicker = false
    @State private var inputImage: UIImage?
        
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            VStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(.ultraThinMaterial)
                    
                    Text("Tap to select a picture")
                        .foregroundColor(.secondary)
                        .font(.headline)
                    
                    memoImage?
                        .resizable()
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                        .scaledToFit()
                        .padding(10)
                }
                .padding()
                .onTapGesture {
                    showingImagePicker = true
                }
                
                Form {
                    Section("Set a description") {
                        TextField("Happy moment...", text: $memoDescription)
                    }
                }
            }
            .onChange(of: inputImage) { _ in loadImage() }
            .sheet(isPresented: $showingImagePicker) {
                ImagePicker(image: $inputImage)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                        // TODO: Save memo.
                        dismiss()
                    }
                }
            }
        }
    }
    
    func loadImage() {
        guard let inputImage = inputImage else { return }
        
        memoImage = Image(uiImage: inputImage)
    }
}

struct AddMemoView_Previews: PreviewProvider {
    static var previews: some View {
        AddMemoView()
    }
}
