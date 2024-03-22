//
//  Review.swift
//  NearMe
//
//  Created by Alumno on 20/03/24.
//

import Foundation

struct Review: Codable, Hashable, Identifiable {
    
    var id: Int
    var name: String
    var user_id: Int
    var review: String
    var rating: Int
    var restaurant_id: Int
    
}

// Restaurants
/*
 1 - Nikkori
 2 - Super Salads
 3 - Chilaquiles TEC
 4 - TEC Food
 5 - Mun's Kitchen
 
 */
