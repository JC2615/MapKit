//
//  MapExample.swift
//  MapKitExploration
//
//  Created by Joshua Curry on 10/4/21.
//

import SwiftUI
import MapKit

struct City: Identifiable {
    let id = UUID()
    let coordinate: CLLocationCoordinate2D
}

struct MapExample: View {
    
    @State private var cities: [City] = [
        City(coordinate: .init(latitude: 40.7128, longitude: 74.0060)),
        City(coordinate: .init(latitude: 37.7749, longitude: 122.4194)),
        City(coordinate: .init(latitude: 47.6062, longitude: 122.3321))
    ]
    
    @ObservedObject private var locationManager = LocationViewModel()
    @State private var userTrackingMode: MapUserTrackingMode = .follow
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(
            latitude: 25.7617,
            longitude: 80.1918
        ),
        span: MKCoordinateSpan(
            latitudeDelta: 10,
            longitudeDelta: 10
        )
    )

    var body: some View {
        VStack {
            Map(
                coordinateRegion: $region,
                interactionModes: MapInteractionModes.all,
                showsUserLocation: true,
                userTrackingMode: $userTrackingMode,
                annotationItems: cities
            ) { city in
                
                // Custom annotation symbol
                MapAnnotation(
                    coordinate: city.coordinate
                ) {
                    Circle()
                        .stroke(Color.green)
                        .frame(width: 44, height: 44)
                    Text("A city")
                }
                
                //Apple annotation symbols:
                //MapPin(coordinate: city.coordinate, tint: .blue)
                //MapMarker(coordinate: city.coordinate, tint: .red)
            }
                .ignoresSafeArea()
            Button("zoom") {
                withAnimation {
                    region.span = MKCoordinateSpan(
                        latitudeDelta: 100,
                        longitudeDelta: 100
                    )
                }
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MapExample()
    }
}
