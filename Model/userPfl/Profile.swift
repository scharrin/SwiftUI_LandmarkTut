//
//  Profile.swift
//  LandmarkTut
//
//  Created by macproo on 2020/02/21.
//  Copyright © 2020 ddd. All rights reserved.
//

import SwiftUI

struct Profile {
    var name :String
    var preferNoti: Bool
    var seasonalPhoto: Season
    var goalDate: Date
    static let `default` = Self(name: "dddd", preferNoti: true, seasonalPhoto: .winter)
    init(name: String, preferNoti: Bool = true, seasonalPhoto: Season = .winter) {
        self.name = name
        self.preferNoti = preferNoti
        self.seasonalPhoto = seasonalPhoto
        self.goalDate = Date()
    }
    
    enum Season: String, CaseIterable {
        case string = "🌹"
        case summer = "🌞"
        case fall = "🍁"
        case winter="⛄️"
    }
}
