//
//  CLLocationCoordinate2DToCoordinate.swift
//  PicMemo
//
//  Created by Uriel Ortega on 01/07/23.
//

import CoreLocation
import Foundation

extension CLLocationCoordinate2D {
    init(_ coordinate: Coordinate) {
        self = .init(latitude: coordinate.latitude, longitude: coordinate.longitude)
    }
}
