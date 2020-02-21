//
//  LandmarkList.swift
//  LandmarkTut
//
//  Created by macproo on 2020/02/20.
//  Copyright © 2020 ddd. All rights reserved.
//

import SwiftUI

/// start page: list from rows and set position and touch actions
struct LandmarkList: View {
//    @State var showFabritOnly = true
    @EnvironmentObject var usrData: UserData
    
    var body: some View {
//        NavigationView {
            
//            List (landmarks) { lm in
//                NavigationLink(destination: LandmarkDetail(lndmrk: lm)) {
//                    LandmarkRow(lanmark: lm)
//                }
//            }
            
            List {
                Toggle(isOn: $usrData.showFavOnly) {
                    /// modified alignment
                    HStack {
                        Spacer()
                        Text("Fav only")
                    }
                    
                }
                    /// add tap guesture
                .gesture(
                    TapGesture()
                        .onEnded { _ in self.usrData.showFavOnly = !self.usrData.showFavOnly
                })
                
                /// call rows
                ForEach( usrData.lndmrk /*landmarks*/) { lm in
                    if !self.usrData.showFavOnly || lm.isFavorite {
                        NavigationLink(destination: LandmarkDetail(lndmrk: lm))
                        {
                            LandmarkRow(lanmark: lm)
                        }
                    }
                    
                }
            }
            .navigationBarTitle(Text("lanmarksss"), displayMode: .inline)
//        }
    }
}

/// inputs for preview
struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
//        LandmarkList()
//        .previewDevice(PreviewDevice(rawValue: "iPhone SE"))

        //        ForEach(["iPhone SE", "iPhone XS Max"], id: \.self){ devcName in
//            LandmarkList()
//            .previewDevice(PreviewDevice(rawValue: devcName))
//            .previewDisplayName(devcName)
//        }
        NavigationView {
            LandmarkList().environmentObject(UserData())
        }
    }
}
