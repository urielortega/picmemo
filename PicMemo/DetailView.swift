//
//  DetailView.swift
//  PicMemo
//
//  Created by Uriel Ortega on 28/06/23.
//

import SwiftUI

struct DetailView: View {
    let memo: Memo
    
    var body: some View {
        VStack {
            Image(uiImage: memo.image)
                .resizable()
                .scaledToFit()
            Text(memo.description)
            Spacer()
        }
        .padding()
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(memo: .example)
    }
}
