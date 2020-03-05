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
//    @Binding var txtVHeight: CGFloat
//    @Environment(\EditMode) var editMod
    let newTextFrameHeightMin: CGFloat = 0
    let newTextFrameHeightShort: CGFloat = 80
    let newTextFrameHeightMax: CGFloat = 404
    let listTextFrameHeight: CGFloat = 100
    let listTextFrameWidth: CGFloat = 404
    let listTextFrameSpacing: CGFloat = 5
    let rowCornerRadius: CGFloat = 10
    let listPadding: CGFloat = 5
    let listTextPadding: CGFloat = 5
    let longPressGesTime: Double = 2.0
    private let MainBGColor = Color(hue:180/360, saturation:0/100, brightness:90/100)
    @State var rowHeight : CGFloat = 0
    
    var body: some View {
        
        ZStack {
            MainBGColor
                .edgesIgnoringSafeArea(.all)
                .onTapGesture { self.endTxtEdit() }
            VStack (spacing:listPadding) {
                txtVw(text: "", viewHeight: $rowHeight)
                    .frame( height:
                        self.rowHeight < newTextFrameHeightShort
                            ? newTextFrameHeightShort : self.rowHeight > newTextFrameHeightMax
                            ? newTextFrameHeightMax : self.rowHeight
                    )
                    .cornerRadius(rowCornerRadius)
                    .padding(.leading, listPadding)
                    .padding(.trailing, listPadding)
                ScrollView {
                    VStack ( spacing: listPadding ) {
                        ForEach( notes ) { n in

                            Button(action: { self.memoExpanded.toggle() }) {
                                if self.memoExpanded {
                                    /// when tapped a memo
                                    MemoDetailV()
                                } else {
                                    /// memo preview before tap
                                    memoListRowV(_memo: .constant("123456789012345678901234567890123456789012345678901234567890"))
                                /// shapes
                                }
                            }   /// button
                            .padding(self.listPadding)
                            .background(Color.white)
                            .cornerRadius(self.rowCornerRadius)
                        }   /// foreach
                        .onDelete(perform: delRw)
                    }   /// vstack
                    .padding(.leading, listPadding)
                    .padding(.trailing, listPadding)
                    .padding(.bottom, listPadding)
                }   /// scroll view
                .onTapGesture { self.endTxtEdit() }
            }   /// vstack
        }   /// zstack
    }
    
    func endTxtEdit() {
        UIApplication.shared.txtVEndEditing()
    }
    func rwMov() {
        
    }
    func delRw(at delIdx : IndexSet ) {
        if let _idx = delIdx.first {
            self.notes.remove(at: _idx)
        }
    }
}

extension UIApplication {
    func txtVEndEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
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
//            , txtVHeight: .constant(0)
        )
//        StartV({})
    }
}
