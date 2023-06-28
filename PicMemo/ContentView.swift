//
//  ContentView.swift
//  PicMemo
//
//  Created by Uriel Ortega on 28/06/23.
//

import SwiftUI

struct ContentView: View {
    @State private var memos = [Memo]()
    
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
                Button { // TODO: Show ImagePicker.
                    // Temporarily adding Memo examples for testing.
                    memos.append(
                        Memo(
                            id: UUID(),
                            image: UIImage(imageLiteralResourceName: "hello"),
                            description: "This is an example memo."
                        )
                    )
                } label: {
                    Image(systemName: "camera")
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
