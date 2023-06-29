//
//  Memo.swift
//  PicMemo
//
//  Created by Uriel Ortega on 28/06/23.
//

import Foundation
import SwiftUI

struct Memo: Identifiable, Codable {
    var id: UUID
    
    var imageData: Data
    
    var uiImage: UIImage {
        UIImage(data: self.imageData)!
    }
    
    var description: String
    
    static var example = Memo(
        id: UUID(),
        imageData: UIImage(named: "hello")!.pngData()!,
        description: "This is an example memo."
    )
}
