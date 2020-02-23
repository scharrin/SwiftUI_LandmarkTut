//
//  MultilineTxtV.swift
//  LandmarkTut
//
//  Created by macproo on 2020/02/23.
//  Copyright © 2020 ddd. All rights reserved.
//

import SwiftUI
import UIKit

struct MultilineTxtV: UIViewRepresentable {
    typealias UIViewType = UITextView
    
    @Binding var txt: String
    let txtPlcehldr: String = "tab and chatcha"
    
    func makeUIView(context: UIViewRepresentableContext<MultilineTxtV>) -> UITextView {
        let MultilineTxtV = UITextView()
        
        MultilineTxtV.textContainer.lineFragmentPadding = 0
        MultilineTxtV.textContainerInset = .zero
//        MultilineTxtV.backgroundColor = .tertiarySystemBackground
        
        /// placeholder
//        if txt == "" {
//            MultilineTxtV.text = txtPlcehldr
//            MultilineTxtV.textColor = .placeholderText
//        } else {
//            MultilineTxtV.text = txt
//            MultilineTxtV.textColor = .black
//        }
        
        return MultilineTxtV
    }
    
    func makeCoordinator() -> Cordntr {
        Coordinator(self)
    }
    
    func updateUIView(_ _uiV: UITextView, context: UIViewRepresentableContext<MultilineTxtV>) {
        
        _uiV.text = txt
        _uiV.delegate = context.coordinator
    }
    
    class Cordntr: NSObject, UITextViewDelegate {
        var prnt: MultilineTxtV
        
        
        init(_ _prnt: MultilineTxtV) {
            self.prnt = _prnt
        }
        
        func textViewDidChange(_ _txtV: UITextView) {
            prnt.txt = _txtV.text
        }
        func textViewDidBeginEditing(_ _txtV: UITextView) {
            if _txtV.textColor == .placeholderText && _txtV.text == prnt.txtPlcehldr
            {
                _txtV.text = nil
                _txtV.textColor = .black
            }
        }
        func textViewDidEndEditing(_ _txtV: UITextView) {
            if _txtV.text.isEmpty {
                _txtV.text = prnt.txtPlcehldr
                _txtV.textColor = .placeholderText
            }
        }
    }
}
