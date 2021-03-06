//
//  memoListRowV.swift
//  LandmarkTut
//
//  Created by macproo on 2020/02/23.
//  Copyright © 2020 ddd. All rights reserved.
//

import SwiftUI

struct memoListRowV: View {

//    @Environment(\.presentationMode) private var presentationMode
    @Binding var _memo: String
//    var _memo: String
    private let hdrTxtLen = 13
    private let hdrFontSize: CGFloat = 25
    private let cntntsFontColor = Color(hue:180/360, saturation:0/100, brightness:50/100)

    var body: some View {
        HStack{
            VStack (alignment: .leading){
                if _memo.count > hdrTxtLen {
                    Text(_memo.prefix(hdrTxtLen))
                        .foregroundColor(.black)
                        .font(.system(size: hdrFontSize))
                        .font(.headline)
                    Text(_memo.suffix(_memo.count - hdrTxtLen))
                        .foregroundColor(cntntsFontColor)
                        .font(.subheadline)
                        .lineLimit(2)
                } else {
                    Text(_memo)
                        .font(.system(size: hdrFontSize))
                        .font(.headline)
                }
//            Button("save") {
//                self.presentationMode.wrappedValue.dismiss()
//            }
            }
        Spacer()
        }
    }
}

struct memoListRowV_Previews: PreviewProvider {
    static var previews: some View {
        memoListRowV(_memo: .constant("12345678901234567890"))
    }
}
