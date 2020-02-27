//
//  StartV.swift
//  LandmarkTut
//
//  Created by macproo on 2020/02/23.
//  Copyright © 2020 ddd. All rights reserved.
//

import SwiftUI

struct StartV: View {
    
    @State var newText: String = ""
    @State var notes: [Note]
    @State private var memoExpanded: Bool = false
//    @Environment(\EditMode) var editMod
    let newTextFrameHeight: CGFloat = 100
    let listTextFrameHeight: CGFloat = 50
    let listTextFrameWidth: CGFloat = 404
    let listTextFrameSpacing: CGFloat = 5
    let rowCornerRadius: CGFloat = 10
    let listPadding: CGFloat = 5
    let listTextPadding: CGFloat = 5
    let longPressGesTime: Double = 2.0

    var body: some View {
        ZStack {
            Color.gray
                .edgesIgnoringSafeArea(.all)
            VStack {
                txtVw(text: $newText)
                    .frame( height: newTextFrameHeight )
                    .cornerRadius(rowCornerRadius)
                ScrollView {
                    VStack ( spacing: listTextFrameSpacing ) {
                        ForEach( notes ) { n in
                            Button(action: { self.memoExpanded.toggle() }) {
                                if self.memoExpanded {
                                    /// when tapped a memo
                                    MemoDetailV(_memo: "fffff")
                                } else {
                                    /// memo preview before tap
                                    memoListRowV()
                                /// shapes
                                }
                            }
                            .onLongPressGesture(
                                minimumDuration: self.longPressGesTime
                                , perform: self.rwMov
                            )
                            .padding(self.listTextPadding)
                            .frame(
                                width: self.listTextFrameWidth
                                , height: self.listTextFrameHeight
                                , alignment: .topLeading
                            )
                            .background(Color.white)
                        }
                        .onDelete(perform: delRw)
                        .cornerRadius(self.rowCornerRadius)
                        Spacer()
                    }
                }
            }
            .padding(listPadding)
        }
    }
    
    func rwMov() {
        
    }
    func delRw(at delIdx : IndexSet ) {
        if let _idx = delIdx.first {
            self.notes.remove(at: _idx)
        }
    }
}

struct StartV_Previews: PreviewProvider {
    static var previews: some View {
        StartV(notes:
            [
                Note(saveDate: Date(), headContent: "dd", contents: "contnts sample")
                , Note(saveDate: Date(), headContent: "dd", contents: "contnts sample")
                , Note(saveDate: Date(), headContent: "dd", contents: "contnts sample")
                , Note(saveDate: Date(), headContent: "dd", contents: "contnts sample")
                , Note(saveDate: Date(), headContent: "dd", contents: "contnts sample")
                , Note(saveDate: Date(), headContent: "dd", contents: "contnts sample")
                , Note(saveDate: Date(), headContent: "dd", contents: "contnts sample")
                , Note(saveDate: Date(), headContent: "dd", contents: "contnts sample")
                , Note(saveDate: Date(), headContent: "dd", contents: "contnts sample")
                , Note(saveDate: Date(), headContent: "dd", contents: "contnts sample")
                , Note(saveDate: Date(), headContent: "dd", contents: "contnts sample")
                , Note(saveDate: Date(), headContent: "dd", contents: "contnts sample")
                , Note(saveDate: Date(), headContent: "dd", contents: "contnts sample")
                , Note(saveDate: Date(), headContent: "dd", contents: "contnts sample")
            ]
        )
//        StartV({})
    }
}
