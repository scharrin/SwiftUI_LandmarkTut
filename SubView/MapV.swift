//
//  MapV.swift
//  LandmarkTut
//
//  Created by macproo on 2020/02/20.
//  Copyright © 2020 ddd. All rights reserved.
//

import SwiftUI
import MapKit

struct MapV: UIViewRepresentable {
    var crdn: CLLocationCoordinate2D
    
    func makeUIView(context: Context) -> MKMapView {
        MKMapView(frame: .zero)
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
//        let coordn = CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868)
        let span = MKCoordinateSpan(latitudeDelta: 2.0, longitudeDelta: 2.0)
//        let region = MKCoordinateRegion(center: coordn, span: span)
        let region = MKCoordinateRegion(center: crdn, span: span)
        uiView.setRegion(region, animated: true)
    }
}

struct MapV_Previews: PreviewProvider {
    static var previews: some View {
        MapV(crdn: landmarks[0].locationCoordinate)
    }
}
