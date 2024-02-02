//
//  MapView.swift
//  MixedImmerssive
//
//  Created by Shadman Ahmed on 10/24/23.
//

import SwiftUI
import MapKit

enum ExampleMapStyle: String, CaseIterable, Hashable, Identifiable {
    case hybrid, imagery, standard
    
    var id: String { self.rawValue }
    
    var style: MapStyle {
        switch self {
        case .hybrid: return .hybrid
        case .imagery: return .imagery
        case .standard: return .standard
        }
    }
}

struct MapView: View {
    @State private var mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 40.7128, longitude: -74.0060), span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))
    @State var selectedMapStyle: ExampleMapStyle = .standard
    
    var listings: [Listing]

    var body: some View {
        Map(coordinateRegion: $mapRegion, annotationItems: listings) { listing in
            // Directly create the CLLocationCoordinate2D inside the annotation closure
            MapAnnotation(coordinate: CLLocationCoordinate2D(latitude: listing.latitude, longitude: listing.longitude)) {
                NavigationLink(destination: DetailsView(listing: listing)) {
                    Image(systemName: "mappin.and.ellipse")
                        .foregroundColor(.red) // Customize the icon color
                }
                .buttonStyle(PlainButtonStyle())
            }
        }
        .mapStyle(selectedMapStyle.style)
        .toolbar {
            ToolbarItem {
                Picker(selection: $selectedMapStyle, label: Text("Map Style")) {
                    ForEach(ExampleMapStyle.allCases, id: \.self) { style in
                        Text(style.rawValue.capitalized).tag(style)
                    }
                }
            }
        }
        .navigationBarTitle("All Homes in New York, NY", displayMode: .inline)
    }
}

//#Preview {
//    MapView()
//}
