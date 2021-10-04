//
//  ContentView.swift
//  MapKitExploration
//
//  Created by Joshua Curry on 10/4/21.
//

import SwiftUI
import MapKit

struct MapExample: View {
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
            Map(coordinateRegion: $region)
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
