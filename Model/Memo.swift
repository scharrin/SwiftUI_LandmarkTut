//
//  Memo.swift
//  LandmarkTut
//
//  Created by macproo on 2020/02/20.
//  Copyright © 2020 ddd. All rights reserved.
//

import SwiftUI
import CoreLocation

struct Memo : Hashable, Codable, Identifiable {
    var id: Int
    var name: String = "no Title"
    fileprivate var imageName: String?
    fileprivate var coordinates: Coordinates
    var state: String
    var park: String
    var category: Category
    var isFavorite: Bool
    var isFeatured: Bool
//    var featureImage: Image? {
//        guard isFeatured else { return nil }
//        return Image(
//            ImgAlbum.loadImg(name: "\(imageName)_feature")
//            , scale: 2
//            , label: Text(name)
//        )
//    }
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: coordinates.latitude, longitude: coordinates.longitude)
    }
    enum Category:String, CaseIterable, Codable, Hashable {
        case featured = "Featured"
        case lakes = "Lakes"
        case rivers = "Rivers"
        case mtn = "Mountains"
    }
    
    var image: Image? {
        if imageName != nil {
            return ImgAlbum.shared.img(name: imageName!)
        } else { return nil }
    }
}

//extension Memo {
//    var image: Image? {
//        ImgAlbum.shared.img(name: imageName)
//    }
//}

struct Coordinates: Hashable, Codable{
    var latitude: Double
    var longitude: Double
}
