//
//  ReviewDetail.swift
//  NearMe
//
//  Created by Alumno on 21/03/24.
//

import SwiftUI

struct ReviewDetail: View {
    
    var review: Review
    
    var body: some View {
        VStack {
            HStack {
                Text(review.name)
                    .font(.system(size:24))
                    .bold()
                Spacer()
                StarView(count: review.rating)
            }
            .padding([.bottom], 10)
            
            Text(review.review)
            
            Spacer()
        }
        .padding()
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("Review")
    }
}

#Preview {
    ReviewDetail(review: ModelData().reviews[0])
}
