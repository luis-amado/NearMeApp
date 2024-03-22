//
//  SettingsView.swift
//  NearMe
//
//  Created by Alumno on 21/03/24.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        NavigationView {
            List {
                Section {
                    Text("No settings available")
                        .listRowBackground(Color.clear)
                }
                .listRowInsets(.init())
                
                Section {
                    NavigationLink {
                        List {
                            Text("Luis Adrian Amado Alvarez")
                            Text("Angela Gabriela Pesina de los Santos")
                        }
                        .navigationTitle("Developers")
                    } label: {
                        Text("Developers")
                    }
                }
                
                Section {
                    HStack {
                        Spacer()
                        Image("logo")
                            .resizable()
                            .scaledToFit()
                            .frame(height:100)
                        Spacer()
                    }
                    .listRowBackground(Color.clear)
                }
                .listRowInsets(.init())
            }
            .navigationTitle("Settings")
            .listStyle(.insetGrouped)
        }
    }
}

#Preview {
    SettingsView()
}
