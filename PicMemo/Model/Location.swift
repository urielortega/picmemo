//
//  Location.swift
//  PicMemo
//
//  Created by Uriel Ortega on 01/07/23.
//

import CoreLocation
import Foundation

struct Location: Identifiable, Codable {
    var id = UUID()
    
    var description: String
    let latitude: Double
    let longitude: Double
    
    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: latitude,
            longitude: longitude
        )
    }
}
