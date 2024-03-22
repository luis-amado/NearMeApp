//
//  NearMeApp.swift
//  NearMe
//
//  Created by Alumno on 20/03/24.
//

import SwiftUI

@main
struct NearMeApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(ModelData())
        }
    }
}
