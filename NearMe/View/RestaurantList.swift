//
//  RestaurantList.swift
//  NearMe
//
//  Created by Alumno on 20/03/24.
//

import SwiftUI
import CoreML

struct RestaurantList: View {
    
    @Environment(ModelData.self) var restaurantData
    @State private var selectedOption = 0
    
    var search: String
    
    let model = try? NearMeRecommenderModel(configuration: MLModelConfiguration())
    
    var favoriteRestaurants: [Restaurant] {
        restaurantData.restaurants.filter { restaurant in
            restaurant.isFavorite
        }
    }
    
    var favoriteRestaurantsIndex: [Int64] {
        favoriteRestaurants.map {restaurant in Int64(restaurant.id)}
    }

    func predictSuggestions() -> NearMeRecommenderModelOutput {
        let user = favoriteRestaurantsIndex.reduce(into: [:]) { result, number in
            result[number] = 5.0
        }
        let input = NearMeRecommenderModelInput(items: user, k: 3, exclude: favoriteRestaurantsIndex)
        let recommendedRestaurants = (try? model?.prediction(input: input))!
        return recommendedRestaurants
    }
    
    var body: some View {
        
        var filteredRestaurants: [Restaurant] {
            if(selectedOption == 0) {
                return restaurantData.restaurants
            } else {
                var recommendations: [Restaurant] = []
                if(favoriteRestaurants.count != 0) {
                    let modelOutput = predictSuggestions()
                    for recommendation in modelOutput.recommendations {
                        recommendations.append(restaurantData.restaurants[Int(recommendation)-1])
                    }
                }
                return recommendations
            }
        }
        
        var searchedRestaurants: [Restaurant] {
            filteredRestaurants.filter { restaurant in
                search == "" || restaurant.name.lowercased().contains(search.lowercased())
            }
        }
        
        List {
            Section {
                Picker("", selection: $selectedOption) {
                    Text("All Restaurants").tag(0)
                    Text("Recommendations").tag(1)
                }
                .pickerStyle(.segmented)
                .listRowBackground(Color.clear)
            }
            .listRowInsets(.init())
            
            if(favoriteRestaurants.isEmpty && selectedOption == 1) {
                Section {
                    HStack {
                        Spacer()
                        Text("Favorite some restaurants to get recommendations")
                            .multilineTextAlignment(.center)
                        Spacer()
                    }
                    .listRowBackground(Color.clear)
                }
                .listRowInsets(.init())
            }
            
            ForEach(searchedRestaurants) { restaurant in
                NavigationLink {
                    RestaurantDetail(restaurant: restaurant)
                } label: {
                    RestaurantRow(restaurant: restaurant)
                }
            }
        }
        .listSectionSpacing(10)
    }
}

#Preview {
    RestaurantList(search: "")
        .environment(ModelData())
}
