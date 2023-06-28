//
//  ContentView.swift
//  PicMemo
//
//  Created by Uriel Ortega on 28/06/23.
//

import SwiftUI

struct ContentView: View {
    @State private var memos = [Memo]()
    
    @State private var showingImagePicker = false
    @State private var inputImage: UIImage?
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(memos) { memo in
                    NavigationLink {
                        DetailView(memo: memo)
                    } label: {
                        HStack {
                            Image(uiImage: memo.image)
                                .resizable()
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                                .scaledToFit()
                                .frame(width: 100, height: 60)
                            Text(memo.description)
                                .padding(.leading)
                        }
                        .accessibilityElement()
                        .accessibilityLabel(memo.description)
                    }
                }
            }
            .navigationTitle("PicMemo")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) { // Button for testing purposes.
                    Button {
                        memos.append(
                            Memo(
                                id: UUID(),
                                image: UIImage(imageLiteralResourceName: "hello"),
                                description: "This is an example memo."
                            )
                        )
                    } label: {
                        Image(systemName: "plus")
                            .tint(.purple)
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showingImagePicker = true
                    } label: {
                        Image(systemName: "camera")
                    }
                }
            }
            .sheet(isPresented: $showingImagePicker) {
                ImagePicker(image: $inputImage)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
