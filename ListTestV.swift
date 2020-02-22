//
//  ListTestV.swift
//  LandmarkTut
//
//  Created by macproo on 2020/02/22.
//  Copyright © 2020 ddd. All rights reserved.
//

import SwiftUI

struct ListTestV: View {
    let lst = ["ddd", "ddd", "dd", "d"]
    var body: some View {
        NavigationView {
            List(lst, id: \.self) { ii in
                NavigationLink(destination: ListTestDtlV(i: ii)) {
                    Text(ii)
                }
            }
            .navigationBarTitle("dddd?")
        }
    }
}

struct ListTestDtlV: View {
    let i : String
    var body: some View {
        Text (i)
    }
}

struct ListTestV_Previews: PreviewProvider {
    static var previews: some View {
        ListTestV()
    }
}

//struct ListTestDtlV_Previews: PreviewProvider {
//    static var previews: some View {
//        ListTestDtlV()
//    }
//}
