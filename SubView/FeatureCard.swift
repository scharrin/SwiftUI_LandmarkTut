////
////  FeatureCard.swift
////  LandmarkTut
////
////  Created by macproo on 2020/02/21.
////  Copyright © 2020 ddd. All rights reserved.
////
//
//import SwiftUI
//
//struct FeatureCard: View {
//    var memo: Memo
//    
//    var body: some View {
//        memo.featureImage?
//            .resizable()
////            .aspectRatio(3 / 2, contentMode: .fit)
//            .overlay(TextOverlay(memo: memo))
//    }
//}
//
//struct TextOverlay: View {
//    var memo: Memo
//    
//    var gradient: LinearGradient {
//        LinearGradient(
//            gradient: Gradient(
//                colors: [Color.black.opacity(0.6), Color.black.opacity(0)]),
//            startPoint: .bottom,
//            endPoint: .center)
//    }
//    
//    var body: some View {
//        ZStack(alignment: .bottomLeading) {
//            Rectangle().fill(gradient)
//            VStack(alignment: .leading) {
//                Text(memo.name)
//                    .font(.title)
//                    .bold()
//                Text(memo.park)
//            }
//            .padding()
//        }
//        .foregroundColor(.white)
//    }
//}
//
//struct FeatureCard_Previews: PreviewProvider {
//    static var previews: some View {
//        FeatureCard(memo: features[0])
//    }
//}
//
