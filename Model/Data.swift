//
//  Data.swift
//  LandmarkTut
//
//  Created by macproo on 2020/02/20.
//  Copyright © 2020 ddd. All rights reserved.
//

import SwiftUI
import CoreLocation
import Foundation

/// data treating
let landmarks: [Landmark] = load("landmarkData.json")
let features = landmarks.filter { $0.isFeatured }
let hikeData: [Hike] = load("hikeData.json")

/// load file and decode
/// - Parameter filename: _
func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil) else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}

/// image treating
final class ImgAlbum {
    typealias _ImageDic = [String: CGImage]
    fileprivate var imgs: _ImageDic = [:]
    fileprivate static var scale = 2
    static var shared = ImgAlbum()
    
    func img(name: String) -> Image {
        let idx = _validateImg(name: name)
        
        return Image(imgs.values[idx], scale: CGFloat(ImgAlbum.scale), label: Text(name))
    }
    static func loadImg(name: String) -> CGImage {
        guard let url = Bundle.main.url(forResource: name, withExtension: "jpg")
            , let imgSrc = CGImageSourceCreateWithURL(url as NSURL, nil)
            , let img = CGImageSourceCreateImageAtIndex(imgSrc, 0, nil)
        else {
            fatalError("Couldn't load image \(name).jpg from main bundle.")
        }
        return img
    }
    
    fileprivate func _validateImg(name: String) -> _ImageDic.Index {
        if let idx = imgs.index(forKey: name) { return idx }
        imgs[name] = ImgAlbum.loadImg(name: name)
        return imgs.index(forKey: name)!
    }
}
