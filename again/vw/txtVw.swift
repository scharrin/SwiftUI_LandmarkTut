//
//  MulTxtV.swift
//  LandmarkTut
//
//  Created by macproo on 2020/02/23.
//  Copyright © 2020 ddd. All rights reserved.
//

import SwiftUI

struct txtVw: UIViewRepresentable {
    @State var text: String
    @Binding var viewHeight: CGFloat
    
    let textPadding: CGFloat = 5
    let placeHolderText = "sup?"
    let placeHolderTextColor: UIColor = .placeholderText
    let defTextColor: UIColor = .label
    
    func makeUIView(context: UIViewRepresentableContext<txtVw>) -> UITextView {
        let mulTxtV = UITextView()
        
        mulTxtV.textContainer.lineFragmentPadding = 0
        mulTxtV.textContainerInset = .init(
            top: textPadding
            , left: textPadding
            , bottom: textPadding
            , right: textPadding
        )
        
//        if text != "" || mulTxtV.textColor == defTextColor {
//            mulTxtV.textColor = defTextColor
//            mulTxtV.text = text
//        } else {
            mulTxtV.textColor = placeHolderTextColor
            mulTxtV.text = placeHolderText
//        }
        
        viewHeight = mulTxtV.contentSize.height

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
            parent.viewHeight = textView.contentSize.height
        }
        func textViewDidBeginEditing(_ textView: UITextView) {
            if textView.textColor == .placeholderText {
                textView.textColor = parent.defTextColor
                textView.text = ""
            }
        }
        func textViewDidEndEditing(_ textView: UITextView) {
            if textView.text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
                textView.textColor = parent.placeHolderTextColor
                textView.text = parent.placeHolderText
            }
        }
        
    }
    
//    func placeHold( _txtV: UITextView, _txt: String ) -> UITextView {
//         if text == "" {
//            _txtV.textColor = .placeholderText
//            _txtV.adjustsFontForContentSizeCategory = true
//            _txtV.text = "sup?"
//        } else {
//            _txtV.textColor = .label
//            _txtV.adjustsFontForContentSizeCategory = false
//            _txtV.font = .systemFont(ofSize: 13)
//            _txtV.text = text
//        }
//        return _txtV
//    }
    
}

//struct ListTestV2: View {
//    var body: some View {
//        txtVw("ddddddd")
//    }
//}
//
//
//struct ListTestV2_Previews: PreviewProvider {
//    static var previews: some View {
//        Group {
//            ListTestV2()
//        }
//    }
//}
