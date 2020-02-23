//
//  ListTestV.swift
//  LandmarkTut
//
//  Created by macproo on 2020/02/22.
//  Copyright © 2020 ddd. All rights reserved.
//

import SwiftUI

struct ListTestV: View {
    
    @State var tmpMemo: String
    let lst = ["ddd", "ddd", "dd", "d"]
    var body: some View {
        VStack {
            Text("dddd")
//            NavigationView {
//                List(lst, id: \.self) { ii in
//                    NavigationLink(destination: ListTestDtlV(i: ii)) {
//                        Text(ii)
//                    }
//                }
//                .navigationBarTitle("dddd?")
//            }
            TxtV(txt: $tmpMemo)
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
        ListTestV(tmpMemo: "")
    }
}

struct TxtV: UIViewRepresentable {
    typealias UIViewType = UITextView
    
    @Binding var txt: String
    
    func makeUIView(context: UIViewRepresentableContext<TxtV>) -> UITextView {
        let txtV = UITextView()
        
        txtV.textContainer.lineFragmentPadding = 0
        txtV.textContainerInset = .zero
        txtV.font = UIFont.systemFont(ofSize: 22)
        
        return txtV
    }
    
    func makeCoordinator() -> Cordntr {
        Coordinator(self)
    }
    
    func updateUIView(_ _uiV: UITextView, context: UIViewRepresentableContext<TxtV>) {
        
        _uiV.text = txt
        _uiV.delegate = context.coordinator
    }
    
    class Cordntr: NSObject, UITextViewDelegate {
        var prnt: TxtV
        
        
        init(_ _prnt: TxtV) {
            self.prnt = _prnt
        }
    }
}

//struct ListTestDtlV_Previews: PreviewProvider {
//    static var previews: some View {
//        ListTestDtlV()
//    }
//}
