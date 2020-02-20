//
//  LandmarkRow.swift
//  LandmarkTut
//
//  Created by macproo on 2020/02/20.
//  Copyright © 2020 ddd. All rights reserved.
//

import SwiftUI

struct LandmarkRow: View {
    var lanmark: Landmark
    var body: some View {
        HStack {
            lanmark.image
                .resizable()
                .frame(width: 50, height: 50)
            Text(lanmark.name)
            Spacer()
            if lanmark.isFavorite {
                Image(systemName: "star.fill")
                    .imageScale(.medium)
                    .foregroundColor(.yellow)
            }
        }
    }
}

struct LandmarkRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            LandmarkRow(lanmark: landmarks[0])
            LandmarkRow(lanmark: landmarks[1])
            LandmarkRow(lanmark: landmarks[2])
            LandmarkRow(lanmark: landmarks[3])
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
