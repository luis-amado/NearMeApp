//
//  RestaurantDetail.swift
//  NearMe
//
//  Created by Alumno on 20/03/24.
//

import SwiftUI

struct RestaurantDetail: View {
    
    var restaurant: Restaurant
    @Environment(ModelData.self) var modelData
    
    var reviewsForRestaurant: [Review] {
        modelData.reviews.filter { review in
            review.restaurant_id == restaurant.id
        }
    }
    
    var restaurantIndex: Int {
        modelData.restaurants.firstIndex(where: {
            $0.id == restaurant.id
        })!
    }
    
    var body: some View {
        @Bindable var modelData = modelData
        
        ScrollView {
            VStack {
                restaurant.image
                    .resizable()
                    .scaledToFill()
                    .frame(width: UIScreen.main.bounds.width, height: 200)
                    .clipped()
                
                VStack {
                    HStack {
                        Text("About this restaurant")
                            .font(.system(size: 24))
                            .bold()
                        Spacer()
                        FavoriteButton(isSet: $modelData.restaurants[restaurantIndex].isFavorite)
                    }
                    .padding([.bottom])
                    
                    Text(restaurant.description)
                        .font(.system(size: 16))
                }
                .padding()
                
                VStack {
                    HStack {
                        Text("Location")
                            .font(.system(size:24))
                            .bold()
                        Spacer()
                        Text("5 min walk")
                            .foregroundColor(.gray)
                    }
                    
                    MapView(coordinate: restaurant.locationCoordinate, name: restaurant.name)
                        .frame(height: 200)
                }.padding()
                
                VStack {
                    HStack {
                        Text("Reviews")
                            .font(.system(size:24))
                            .bold()
                        Spacer()
                    }
                    
                    Group {
                        ForEach(reviewsForRestaurant) {review in
                            NavigationLink {
                                ReviewDetail(review:review)
                            } label: {
                                ReviewRow(review: review)
                            }
                            .buttonStyle(.plain)
                        }
                    }
                }
                .padding()
            }
        }
        .navigationTitle(restaurant.name)
    }
}

#Preview {
    let modelData = ModelData()
    return RestaurantDetail(restaurant: modelData.restaurants[0])
        .environment(modelData)
}
