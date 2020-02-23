//
//  StartV.swift
//  LandmarkTut
//
//  Created by macproo on 2020/02/23.
//  Copyright © 2020 ddd. All rights reserved.
//

import SwiftUI

struct StartV: View {
    
    @EnvironmentObject private var udata: UData
    
    var body: some View {
        Text("Doin somethin")
//        NavigationView {
//            List {
//                ForEach ( udata.mm ) { _memo in
//                    NavigationLink(destination: MemoDetailV(_memo: _memo)) {
//                        memoListRowV(_memo)
//                    }
//                }
//            }
//        }
//    .navheader  title and compose button
    }
}

struct StartV_Previews: PreviewProvider {
    static var previews: some View {
        StartV()
    }
}
