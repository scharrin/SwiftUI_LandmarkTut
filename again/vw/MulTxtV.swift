//
//  MulTxtV.swift
//  LandmarkTut
//
//  Created by macproo on 2020/02/23.
//  Copyright © 2020 ddd. All rights reserved.
//

import SwiftUI

struct MulTxtV: UIViewRepresentable {
    typealias UIViewType = UITextView
    
//    @EnvironmentObject var txt: String
    var txt : String = ""
    
    func makeUIView(context: UIViewRepresentableContext<MulTxtV>) -> UITextView {
        let mulTxtV = UITextView()
        
        mulTxtV.textContainer.lineFragmentPadding = 0
        mulTxtV.textContainerInset = .zero
        return mulTxtV
    }
    func updateUIView(_ _uiV: UITextView, context: UIViewRepresentableContext<MulTxtV>) {
        _uiV.text = txt
        _uiV.delegate = context.coordinator
    }
    func makeCoordinator() -> Coordntr {
        Coordinator(self)
    }
    
    class Coordntr: NSObject, UITextViewDelegate {
        var parent: MulTxtV
        
        init(_ _parent: MulTxtV) {
            self.parent = _parent
        }

//        func textViewDidChange(_ textView: UITextView) {
//            <#code#>
//        }
//        func textViewDidBeginEditing(_ textView: UITextView) {
//            <#code#>
//        }
//        func textViewDidEndEditing(_ textView: UITextView) {
//            <#code#>
//        }
        
    }
}
