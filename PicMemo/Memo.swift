//
//  Memo.swift
//  PicMemo
//
//  Created by Uriel Ortega on 28/06/23.
//

import Foundation
import SwiftUI

struct Memo: Identifiable {
    var id: UUID
    
    var image: UIImage
    var description: String
    
    static var example = Memo(
        id: UUID(),
        image: UIImage(imageLiteralResourceName: "hello"),
        description: "This is an example."
    )
}
