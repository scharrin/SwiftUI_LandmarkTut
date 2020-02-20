//
//  LandmarkList.swift
//  LandmarkTut
//
//  Created by macproo on 2020/02/20.
//  Copyright © 2020 ddd. All rights reserved.
//

import SwiftUI

struct LandmarkList: View {
    @State var showFabritOnly = true
    var body: some View {
        NavigationView {
            
//            List (landmarks) { lm in
//                NavigationLink(destination: LandmarkDetail(lndmrk: lm)) {
//                    LandmarkRow(lanmark: lm)
//                }
//            }
            List {
                
                Toggle(isOn: $showFabritOnly) { Text("Fav only") }
                .gesture(TapGesture().onEnded { _ in self.showFabritOnly = !self.showFabritOnly})
                
                ForEach(landmarks) { lm in
                    if !self.showFabritOnly || lm.isFavorite {
                        NavigationLink(destination: LandmarkDetail(lndmrk: lm))
                        {
                            LandmarkRow(lanmark: lm)
                        }
                    }
                    
                }
            }
            .navigationBarTitle(Text("lanmarksss"), displayMode: .inline)
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
//        LandmarkList()
//        .previewDevice(PreviewDevice(rawValue: "iPhone SE"))
        ForEach(["iPhone SE", "iPhone XS Max"], id: \.self){ devcName in
            LandmarkList()
            .previewDevice(PreviewDevice(rawValue: devcName))
            .previewDisplayName(devcName)
        }
    }
}
