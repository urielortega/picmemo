//
//  ContentView.swift
//  PicMemo
//
//  Created by Uriel Ortega on 28/06/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ViewModel()

    @State private var showingAddMemoView = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.memos) { memo in
                    NavigationLink {
                        DetailView(memo: memo)
                    } label: {
                        HStack {
                            Image(uiImage: memo.uiImage)
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
                ToolbarItem(placement: .navigationBarLeading) { // Button just for testing purposes. 🔨
                    Button {
                        viewModel.memos.append(
                            Memo(
                                id: UUID(),
                                imageData: UIImage(named: "hello")!.pngData()!,
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
                        showingAddMemoView = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $showingAddMemoView) {
                AddMemoView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
