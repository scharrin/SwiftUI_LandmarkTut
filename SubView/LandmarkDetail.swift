//
//  LandmarkDetail.swift
//  LandmarkTut
//
//  Created by macproo on 2020/02/20.
//  Copyright © 2020 ddd. All rights reserved.
//

import SwiftUI

/// item detail page from list.
struct LandmarkDetail: View {
    @EnvironmentObject var usrData : UserData
    var lndmrk: Landmark
    
    var lndmrkIdx: Int {
        usrData.lndmrk.firstIndex(where: { $0.id == lndmrk.id})!
    }
    
    var body: some View {
        VStack{
            MapV(crdn: lndmrk.locationCoordinate)
                .edgesIgnoringSafeArea(.top)
                .frame(height: 300)
            CircledImg(img: lndmrk.image)
                .offset(y:-130)
                .padding(.bottom, -130)
            VStack (alignment: .leading){
                
//                Text("bo")
                HStack {
                    Text(lndmrk.name)
                        .font(.title)
                    Button(action: {
                        self.usrData.lndmrk[self.lndmrkIdx].isFavorite.toggle()
                    }) {
                        if self.usrData.lndmrk[self.lndmrkIdx].isFavorite {
                            Image(systemName: "star.fill")
                                .foregroundColor(.yellow)
                        } else {
                            Image(systemName: "star")
                                .foregroundColor(.gray)
                        }
                    }
                }
                HStack (alignment: .top){
//                    Text("bbb")
                    Text(lndmrk.park)
                        .font(.subheadline)
                    Spacer()
//                    Text("bbbbb")
                    Text(lndmrk.state)
                        .font(.subheadline)
                }
            }
            .padding()
            Spacer()
        }
        .navigationBarTitle(Text(lndmrk.name), displayMode: .inline)
    }
}

/// inputs for preview
struct LandmarkDetail_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkDetail(lndmrk: landmarks[0])
        .environmentObject(UserData())
    }
}
