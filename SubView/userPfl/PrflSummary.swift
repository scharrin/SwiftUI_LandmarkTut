//
//  PrflSummary.swift
//  LandmarkTut
//
//  Created by macproo on 2020/02/21.
//  Copyright © 2020 ddd. All rights reserved.
//

import SwiftUI

struct PrflSummary: View {
    var profile : Profile
    
    static let goalFormat: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .none
        return formatter
    }()
    
    
    var body: some View {
        List {
            Text("notifications: \(self.profile.preferNoti ? "On": "Off")")
            Text("Seasonal Photos: \(self.profile.seasonalPhoto.rawValue)")
            Text("Goal date: \(self.profile.goalDate, formatter: Self.goalFormat)")
            VStack (alignment: .leading) {
                Text("Completed Badges")
                    .font(.headline)
                ScrollView{
                    HStack {
                        HikeBedge(name: "first Hike")
                        HikeBedge(name: "Earth Day")
                            .hueRotation(Angle(degrees: 90))
                        HikeBedge(name: "Tenth Hike")
                            .grayscale(0.5)
                            .hueRotation(Angle(degrees: 45))
                    }
                }
                .frame(height: 140)
            }
            VStack (alignment: .leading) {
                Text("Recent Records")
                    .font(.headline)
                HikeView(hike: hikeData[0])
            }
        }
    }
}

struct PrflSummary_Previews: PreviewProvider {
    static var previews: some View {
        PrflSummary(profile: Profile.default)
    }
}
