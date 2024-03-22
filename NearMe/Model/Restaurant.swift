//
//  Restaurant.swift
//  NearMe
//
//  Created by Alumno on 20/03/24.
//

import Foundation
import SwiftUI
import CoreLocation

struct Restaurant: Hashable, Codable, Identifiable {
    
    var id: Int
    var name: String
    var tag: String
    var description: String
    
    var isFavorite: Bool
    
    private var imageName: String
    var image: Image {
        Image(imageName)
    }
    
    private var coordinates: Coordinates
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude
        )
    }
    
    struct Coordinates: Hashable, Codable {
        var latitude: Double
        var longitude: Double
    }
    
}
