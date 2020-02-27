//
//  MulTxtV.swift
//  LandmarkTut
//
//  Created by macproo on 2020/02/23.
//  Copyright © 2020 ddd. All rights reserved.
//

import SwiftUI

struct txtVw: UIViewRepresentable {
    typealias UIViewType = UITextView
//    @EnvironmentObject var txt: String
    @Binding var text: String
    let placeHolderText = "sup?"
    var textPadding: CGFloat = 5
    var textColor: UIColor = .label
    
    func makeUIView(context: UIViewRepresentableContext<txtVw>) -> UITextView {
        let mulTxtV = UITextView()
        
        mulTxtV.textContainer.lineFragmentPadding = 0
        mulTxtV.textContainerInset = .init(
            top: textPadding
            , left: textPadding
            , bottom: textPadding
            , right: textPadding
        )
        
        if text != "" || mulTxtV.textColor == .label {
            mulTxtV.text = placeHolderText
            mulTxtV.textColor = .placeholderText
        }
        
        return mulTxtV
    }
    
    func updateUIView(_ _uiV: UITextView, context: UIViewRepresentableContext<txtVw>) {
        
        _uiV.delegate = context.coordinator
    }
    func makeCoordinator() -> txtVw.Coordntr {
        Coordinator(self)
    }
    
    class Coordntr: NSObject, UITextViewDelegate {
        var parent: txtVw
        
        init(_ _parent: txtVw) {
            self.parent = _parent
        }

        func textViewDidChange(_ textView: UITextView) {
            parent.text = textView.text
        }
        func textViewDidBeginEditing(_ textView: UITextView) {
            if textView.textColor == .placeholderText {
                textView.text = ""
                textView.textColor = .label
            }
        }
        func textViewDidEndEditing(_ textView: UITextView) {
            if textView.text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
                textView.text = parent.placeHolderText
                textView.textColor = .placeholderText
            }
        }
        
    }
}
