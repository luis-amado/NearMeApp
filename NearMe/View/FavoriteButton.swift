//
//  FavoriteButton.swift
//  NearMe
//
//  Created by Alumno on 21/03/24.
//

import SwiftUI

struct FavoriteButton: View {
    
    @Binding var isSet: Bool
    
    var body: some View {
        Button {
            isSet.toggle()
        } label: {
            Label("Toggle Favorite", systemImage: isSet ? "heart.fill" : "heart")
                .labelStyle(.iconOnly)
                .foregroundStyle(isSet ? .pink : .gray)
        }
    }
}

#Preview {
    FavoriteButton(isSet: .constant(true))
}
