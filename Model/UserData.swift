//
//  UserData.swift
//  LandmarkTut
//
//  Created by macproo on 2020/02/20.
//  Copyright © 2020 ddd. All rights reserved.
//

import SwiftUI
import Combine

/// temporarily saving user inputs ( just favorit or not for now )
final class UserData: ObservableObject {
    @Published var showFavOnly = false
    @Published var lndmrk = landmarks
}
