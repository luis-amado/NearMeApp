//
//  StarView.swift
//  NearMe
//
//  Created by Alumno on 21/03/24.
//

import SwiftUI

struct StarView: View {
    var count: Int
    
    var body: some View {
        HStack {
            ForEach((0...4), id:\.self) {
                Image(systemName: $0 < count ? "star.fill" : "star")
                    .foregroundColor(.blue)
                    .id($0)
            }
        }
    }
}

#Preview {
    StarView(count: 3)
}
