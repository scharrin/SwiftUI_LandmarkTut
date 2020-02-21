//
//  HikeBedge.swift
//  LandmarkTut
//
//  Created by macproo on 2020/02/21.
//  Copyright © 2020 ddd. All rights reserved.
//

import SwiftUI

struct HikeBedge: View {
    var name: String
    var body: some View {
        VStack (alignment: .center) {
            Badge()
                .frame(width: 300, height: 300)
                .scaleEffect(1.0/3.0)
                .frame(width: 100, height: 100)
            Text(name)
                .font(.caption)
                .accessibility(label: Text("Badge for \(name)."))
        }
    }
}

struct HikeBedge_Previews: PreviewProvider {
    static var previews: some View {
        HikeBedge(name: "prev testing")
    }
}
