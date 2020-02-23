//
//  MemoContentV.swift
//  LandmarkTut
//
//  Created by macproo on 2020/02/20.
//  Copyright © 2020 ddd. All rights reserved.
//

import SwiftUI

/// item detail page from list.
struct MemoContentV: View {
    @EnvironmentObject var usrData : UserData
//    @Environment(\.editMode) var edtMod
    @State var editing: Bool = false
    @State var tmpMemo: String = ""
    
    var memo: Memo
    
    var memoIdx: Int {
        usrData.memosUD.firstIndex(where: { $0.id == memo.id})!
    }
    
    var body: some View {
        VStack{
//            MapV(crdn: memo.locationCoordinate)
//                .edgesIgnoringSafeArea(.top)
//                .frame(height: 300)
//            Group {
//                if memo.image != nil {
//                CircledImg(img: memo.image!)
//                .offset(y:-130)
//                .padding(.bottom, -130)
//            }
//            }
            VStack {
                HStack {
//                    Text(memo.name)
//                        .font(.title)
                    Spacer()

                    Button(action: {
                        self.usrData.memosUD[self.memoIdx].isFavorite.toggle()
                    }) {
                        if self.usrData.memosUD[self.memoIdx].isFavorite {
                            Image(systemName: "star.fill")
                                .foregroundColor(.yellow)
                        } else {
                            Image(systemName: "star")
                                .foregroundColor(.gray)
                        }
                    }
                }
                    MultilineTxtV(txt: $tmpMemo)
            }
            .padding()
        }
        .navigationBarTitle(Text(memo.name), displayMode: .inline)
    }
}

#if DEBUG
/// inputs for preview
struct MemoContentV_Previews: PreviewProvider {
    static var previews: some View {
        MemoContentV(memo: memos[0])
        .environmentObject(UserData())
    }
}

#endif /// DEBUG END
