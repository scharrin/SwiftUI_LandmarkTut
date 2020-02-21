//
//  HikeView.swift
//  LandmarkTut
//
//  Created by macproo on 2020/02/20.
//  Copyright © 2020 ddd. All rights reserved.
//

import SwiftUI

extension AnyTransition {
    static var moveAndFade : AnyTransition {
//        AnyTransition.move(edge: .trailing)
        let enterT = AnyTransition.move(edge: .trailing)
            .combined(with: .opacity)
        let exitT = AnyTransition.scale
            .combined(with: .opacity)
        return .asymmetric(insertion: enterT, removal: exitT)
    }
}

struct HikeView: View {
    var hike : Hike
    @State private var showDetail = true
    
    var body: some View {
        VStack {
            HStack {
                HikeGraph(hike: hike, path: \.elevation)
                .frame(width: 50, height: 30)
//                .animation(nil)
                
                VStack (alignment: .leading) {
                    Text(hike.name)
                        .font(.headline)
                    Text(hike.distanceText)
                }
                Spacer()
                Button(action: {/*self.showDetail.toggle()*/
                    withAnimation (/*.easeInOut(duration: 4)*/){
                        self.showDetail.toggle()
                    }}) {
                    Image(systemName: "chevron.right.circle")
                        .imageScale(.large)
                        .rotationEffect(.degrees(showDetail ? 540 : -360))
//                        .rotationEffect(.degrees(showDetail ? 90 : 0))
//                        .animation(nil)
                        .scaleEffect(showDetail ? 1.5 : 1)
                        .padding()
//                        .animation(.spring())
                }
            }
            
            if showDetail {
                HikeDetail(hike: hike)
                .transition(.moveAndFade)
            }
        }
    }
}

struct HikeView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            HikeView(hike: hikeData[0])
            .padding()
            Spacer()
        }
    }
}
