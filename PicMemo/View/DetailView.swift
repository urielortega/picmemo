//
//  DetailView.swift
//  PicMemo
//
//  Created by Uriel Ortega on 28/06/23.
//

import MapKit
import SwiftUI

struct DetailView: View {
    let memo: Memo
        
    @StateObject private var viewModel = ViewModel()
    
    @State private var mapRegion: MKCoordinateRegion
    
    let locations: [Location] // Array to store the memo location.
    
    var body: some View {
        Form {
            Section {
                Image(uiImage: memo.uiImage ?? Memo.example.uiImage!)
                    .resizable()
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    .scaledToFit()
                    .padding(5)
                    // Accessibility modifiers:
                    .accessibilityLabel("Image of memo: \(memo.description)")
                    .accessibilityHint("The following is a possible description of the image:")
            } footer: {
                Text(memo.description)
            }
                        
            Section("Location") {
                Map(coordinateRegion: $mapRegion, annotationItems: locations) { location in
                    MapMarker(coordinate: location.coordinate)
                }
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .scaledToFill()
                .padding(.vertical)
            }
        }
    }
    
    init(memo: Memo) {
        self.memo = memo
        
        _mapRegion = State(initialValue: MKCoordinateRegion(
            center: CLLocationCoordinate2D(
                latitude: memo.location?.latitude ?? Memo.example.location!.latitude,
                longitude: memo.location?.longitude ?? Memo.example.location!.longitude
            ),
            span: MKCoordinateSpan(
                latitudeDelta: 0.01,
                longitudeDelta: 0.01
            )
        ))
        
        locations = [
            Location(
                description: memo.description,
                latitude: memo.location?.latitude ?? Memo.example.location!.latitude,
                longitude: memo.location?.longitude ?? Memo.example.location!.longitude
            )
        ]
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(memo: .example)
    }
}
