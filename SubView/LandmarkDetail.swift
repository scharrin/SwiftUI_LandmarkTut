//
//  LandmarkDetail.swift
//  LandmarkTut
//
//  Created by macproo on 2020/02/20.
//  Copyright © 2020 ddd. All rights reserved.
//

import SwiftUI

struct LandmarkDetail: View {
    var lndmrk: Landmark
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
                Text(lndmrk.name)
                    .font(.title)
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

struct LandmarkDetail_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkDetail(lndmrk: landmarks[0])
    }
}
