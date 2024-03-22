//
//  ContentView.swift
//  NearMe
//
//  Created by Alumno on 20/03/24.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        TabView {
            RestaurantView()
                .tabItem {
                    Label("Restaurants", systemImage: "house")
                }
            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
        }
    }
}

#Preview {
    ContentView()
        .environment(ModelData())
}
