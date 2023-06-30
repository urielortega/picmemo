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
            Image(uiImage: memo.uiImage ?? Memo.example.uiImage!)
                .resizable()
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .scaledToFit()
                .shadow(color: Color(.sRGBLinear, white: 0, opacity: 0.30), radius: 25)
                // Accessibility modifiers:
                .accessibilityLabel("Image of memo: \(memo.description)")
                .accessibilityHint("The following is a possible description of the image:")
            
            Text(memo.description)
                .font(.title2.bold())
                .padding(.top)
            
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
