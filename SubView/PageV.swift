//
//  PageV.swift
//  LandmarkTut
//
//  Created by macproo on 2020/02/21.
//  Copyright © 2020 ddd. All rights reserved.
//

import SwiftUI

struct PageV<Page: View>: View {
    var vCntrlrs: [UIHostingController<Page>]
    @State private var curntPage = 0
    
    init(_ views: [Page]) {
        self.vCntrlrs = views.map { UIHostingController(rootView: $0) }
    }
    
    var body: some View {
        /*
         Remember to use the $ syntax to create a binding to a value that is stored as state.
         */
        VStack {
            HStack() {
                Spacer()
                Button(action: {
                    if self.curntPage == self.vCntrlrs.count-1 {
                        self.curntPage = 0
                    } else {
                        self.curntPage += 1
                    }
                }) {
                    Text("turn page right")
                        .padding(.trailing, 20)
                }
            }
            ZStack (alignment: .bottomTrailing) {
                PageVC(ctrlrs: vCntrlrs, currentPage: $curntPage)
                PageCntrl(numberOfPage: vCntrlrs.count, currentPageNumber: $curntPage)
                    .padding(.trailing)
            }
//            Text("currnet page number: \(curntPage)")
        }
    }
}
//
//struct PageV_Previews: PreviewProvider {
//    static var previews: some View {
//        PageV( features.map { FeatureCard(memo: $0) })
//            .aspectRatio(3/2, contentMode: .fit)
//    }
//}
