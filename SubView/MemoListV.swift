//
//  MemoListV.swift
//  LandmarkTut
//
//  Created by macproo on 2020/02/20.
//  Copyright © 2020 ddd. All rights reserved.
//

import SwiftUI

struct MemoListV: View {
    @EnvironmentObject var usrData: UserData
    
    var body: some View {
        NavigationView {
            List {
                Toggle(isOn: $usrData.showFavOnly) {
                    HStack {
                        Spacer()
                        Text("Fav only")
                    }
                }
                .gesture(
                    TapGesture()
                        .onEnded {
                            _ in self.usrData.showFavOnly = !self.usrData.showFavOnly
                })
                ForEach ( usrData.memosUD ) { m in
                    if !self.usrData.showFavOnly || m.isFavorite {
                        NavigationLink(destination: MemoContentV(memo: m)) {
                            MemoRow(memo: m)
                        }
                    }
                    
                }
            }
            .navigationBarTitle(Text("Memo"))
        }
    }
}

///// inputs for preview
//struct MemoListV_Previews: PreviewProvider {
//    static var previews: some View {
//            MemoListV().environmentObject(UserData())
//    }
//}
