//
//  CircledImg.swift
//  LandmarkTut
//
//  Created by macproo on 2020/02/20.
//  Copyright © 2020 ddd. All rights reserved.
//

import SwiftUI

/// circle-cut and frame image
struct CircledImg: View {
    var img : Image
    var body: some View {
        img
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.white, lineWidth: 4))
            .shadow(radius: 10)
    }
}

/// inputs for preview
struct CircledImg_Previews: PreviewProvider {
    static var previews: some View {
        CircledImg(img: Image("turtlerock"))
    }
}
