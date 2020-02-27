//
//  MemoDetailV.swift
//  LandmarkTut
//
//  Created by macproo on 2020/02/23.
//  Copyright © 2020 ddd. All rights reserved.
//

import SwiftUI

struct MemoDetailV: View {
    
    @Environment(\.presentationMode) private var presentationMode
//    @Binding var _memo =
    var _memo: String
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button("save") {
                    self.presentationMode.wrappedValue.dismiss()
                }
            }
//            txtVws(txt: _memo)
        }
    }
}

struct MemoDetailV_Previews: PreviewProvider {
    static var previews: some View {
        MemoDetailV(_memo:"dddd")
    }
}
