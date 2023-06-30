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
                ForEach(viewModel.memos.sorted()) { memo in
                    NavigationLink {
                        DetailView(memo: memo)
                    } label: {
                        HStack {
                            Image(uiImage: memo.uiImage!)
                                .resizable()
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                                .scaledToFit()
                                .frame(width: 100, height: 60)
                            Text(memo.description)
                                .padding(.leading)
                        }
                        // Accessibility modifiers:
                        .accessibilityElement()
                        .accessibilityLabel(memo.description)
                    }
                }
            }
            .navigationTitle("PicMemo")
            .toolbar {
                Button {
                    showingAddMemoView = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showingAddMemoView) {
                AddMemoView(memo: Memo(id: UUID(), description: "")) { memo in
                    viewModel.updateMemos(with: memo)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
