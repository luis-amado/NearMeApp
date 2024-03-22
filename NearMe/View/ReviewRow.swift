//
//  ReviewRow.swift
//  NearMe
//
//  Created by Alumno on 20/03/24.
//

import SwiftUI

struct ReviewRow: View {
    
    var review: Review
    
    var body: some View {
        HStack {
            Text(review.name)
            Spacer()
            StarView(count: review.rating)
            .padding([.trailing],10)
            Image(systemName:"chevron.right")
                .font(Font.system(.footnote).weight(.semibold))
                .foregroundColor(.gray)
        }
        .padding([.top,.bottom],10)
    }
}

#Preview {
    ReviewRow(review: ModelData().reviews[1])
}
