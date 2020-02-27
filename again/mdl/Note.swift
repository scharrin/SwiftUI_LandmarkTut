//
//  Note.swift
//  LandmarkTut
//
//  Created by macproo on 2020/02/25.
//  Copyright © 2020 ddd. All rights reserved.
//

import UIKit

struct Note: Identifiable {
    var id = UUID()
    var saveDate: Date
    var headContent: String
    var contents: String
}
