//
//  PageCntrl.swift
//  LandmarkTut
//
//  Created by macproo on 2020/02/22.
//  Copyright © 2020 ddd. All rights reserved.
//

import SwiftUI
import UIKit

struct PageCntrl: UIViewRepresentable {
    var numberOfPage: Int
    @Binding var currentPageNumber: Int
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIView(context: Context) -> UIPageControl {
        let cntrl = UIPageControl()
        cntrl.numberOfPages = self.numberOfPage
        cntrl.addTarget(
            context.coordinator
            , action: #selector(Coordinator.updateCurrentPage(sender:))
            , for: .valueChanged
        )
        
        return cntrl
    }
    
    func updateUIView(_ uiView: UIPageControl, context: Context) {
        uiView.currentPage = currentPageNumber
    }
    
    class Coordinator: NSObject {
        var cntrl: PageCntrl
        
        init(_ cntrl: PageCntrl) {
            self.cntrl = cntrl
        }
        
        @objc func updateCurrentPage(sender: UIPageControl) {
            cntrl.currentPageNumber = sender.currentPage
        }
    }
}
