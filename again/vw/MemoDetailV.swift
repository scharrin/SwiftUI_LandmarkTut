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
     var _memo: String
    var body: some View {
        VStack {
//            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            HStack {
//                saveButton()
                Button("save") {
                    self.presentationMode.wrappedValue.dismiss()
                }
            }
            MulTxtV(txt: _memo)
        }
    }
}

struct MemoDetailV_Previews: PreviewProvider {
    static var previews: some View {
        MemoDetailV(_memo: /*.constant(*/mms[0])/*)*/
    }
}
