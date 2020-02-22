//
//  HikeDetail.swift
//  LandmarkTut
//
//  Created by macproo on 2020/02/20.
//  Copyright © 2020 ddd. All rights reserved.
//

import SwiftUI

struct HikeDetail: View {
    let hike: Hike
    @State var dataToShow = \Hike.Observation.elevation
    
    var buttons = [
        ("Elevation", \Hike.Observation.elevation)
        , ( "Heart Rate", \Hike.Observation.heartRate)
        , ( "Pace", \Hike.Observation.pace)
    ]
    
    var body: some View {
        return VStack {
            HikeGraph(hike: hike, path: dataToShow)
                .frame(height: 200)
            HStack (spacing: 25) {
                ForEach (buttons, id: \.0) { val in
                    Button(action: {
                        self.dataToShow = val.1
                    }) {
                        Text(val.0)
                            .font(.system(size: 15))
                            .foregroundColor(val.1 == self.dataToShow ? Color.gray : Color.accentColor)
                            .animation(nil)
                    }
                }
            }
        }
    }
}

struct HikeDetail_Previews: PreviewProvider {
    static var previews: some View {
        HikeDetail(hike: hikeData[0])
    }
}
