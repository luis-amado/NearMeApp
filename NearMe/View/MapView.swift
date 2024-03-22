//
//  MapView.swift
//  NearMe
//
//  Created by Alumno on 20/03/24.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    var coordinate: CLLocationCoordinate2D
    var name: String
    
    var body: some View {
        Map(position: .constant(.region(region))) {
            Marker(name, coordinate: coordinate)
        }
    }
    
    private var region: MKCoordinateRegion {
        MKCoordinateRegion(
            center: coordinate,
            span: MKCoordinateSpan(latitudeDelta: 0.001, longitudeDelta: 0.001)
        )
    }
}

#Preview {
    MapView(coordinate: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868), name: "Tienda")
}
