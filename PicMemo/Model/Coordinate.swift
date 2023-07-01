//
//  Coordinate.swift
//  PicMemo
//
//  Created by Uriel Ortega on 01/07/23.
//

import CoreLocation
import Foundation

struct Coordinate: Codable, Hashable {
    let latitude, longitude: Double
}

extension Coordinate {
    init(_ coordinate: CLLocationCoordinate2D) {
        self = .init(latitude: coordinate.latitude, longitude: coordinate.longitude)
    }
}
