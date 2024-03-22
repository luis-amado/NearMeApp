//
//  RestaurantView.swift
//  NearMe
//
//  Created by Alumno on 21/03/24.
//

import SwiftUI

struct RestaurantView: View {
    @State private var search = ""
    @Environment(ModelData.self) var restaurantData
    
    var body: some View {
        NavigationStack {
            RestaurantList(search: search)
                .navigationTitle("What's Near?")
                .searchable(text: $search)
        }
    }
}

#Preview {
    RestaurantView()
        .environment(ModelData())
}
