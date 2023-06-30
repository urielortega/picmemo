//
//  Memo.swift
//  PicMemo
//
//  Created by Uriel Ortega on 28/06/23.
//

import Foundation
import SwiftUI

struct Memo: Identifiable, Codable, Comparable {
    var id: UUID
    
    var imageData: Data?
    
    var uiImage: UIImage? {
        UIImage(data: (self.imageData ?? UIImage(named: "placeholder")!.pngData())!)
    }
    
    var description: String
    
    static var example = Memo(
        id: UUID(),
        imageData: UIImage(named: "placeholder")!.pngData(),
        description: "This is an example memo."
    )
    
    static func < (lhs: Memo, rhs: Memo) -> Bool {
        lhs.description < rhs.description
    }
}
