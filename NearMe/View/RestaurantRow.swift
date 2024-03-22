//
//  RestaurantRow.swift
//  NearMe
//
//  Created by Alumno on 20/03/24.
//

import SwiftUI

struct RestaurantRow: View {
    
    var restaurant: Restaurant
    
    var body: some View {
        
        HStack {
            restaurant.image
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 50, height: 50)
                .cornerRadius(10)
            Text(restaurant.name)
            Spacer()
            
            if restaurant.isFavorite {
                Image(systemName: "heart.fill")
                    .foregroundStyle(.pink)
            }
        }
        
    }
}

#Preview {
    RestaurantRow(restaurant: ModelData().restaurants[0])
}
