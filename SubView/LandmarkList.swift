//
//  LandmarkList.swift
//  LandmarkTut
//
//  Created by macproo on 2020/02/20.
//  Copyright © 2020 ddd. All rights reserved.
//

import SwiftUI

struct LandmarkList: View {
//    @State var showFabritOnly = true
    @EnvironmentObject var usrData: UserData
    
    var body: some View {
        NavigationView {
            
//            List (landmarks) { lm in
//                NavigationLink(destination: LandmarkDetail(lndmrk: lm)) {
//                    LandmarkRow(lanmark: lm)
//                }
//            }
            List {
                Toggle(isOn: $usrData.showFavOnly) {
                    HStack {
                        Spacer()
                        Text("Fav only")
                    }
                    
                }
                .gesture(TapGesture().onEnded { _ in self.usrData.showFavOnly = !self.usrData.showFavOnly
                })
                
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
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
//        LandmarkList()
//        .previewDevice(PreviewDevice(rawValue: "iPhone SE"))

        //        ForEach(["iPhone SE", "iPhone XS Max"], id: \.self){ devcName in
//            LandmarkList()
//            .previewDevice(PreviewDevice(rawValue: devcName))
//            .previewDisplayName(devcName)
//        }
        
        LandmarkList().environmentObject(UserData())
    }
}
