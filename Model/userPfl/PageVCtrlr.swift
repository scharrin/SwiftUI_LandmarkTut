
//  PageVCtlr.swift
//  LandmarkTut
//
//  Created by macproo on 2020/02/21.
//  Copyright © 2020 ddd. All rights reserved.
//
//  https://developer.apple.com/tutorials/swiftui/interfacing-with-uikit

import SwiftUI
import UIKit

struct PageVC: UIViewControllerRepresentable {
    var ctrlrs: [UIViewController]
    @Binding var currentPage: Int
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIViewController(context: Context) -> UIPageViewController {
        let pageVCtrlr = UIPageViewController (
            transitionStyle: .scroll
            , navigationOrientation: .horizontal
        )
        pageVCtrlr.dataSource = context.coordinator
        pageVCtrlr.delegate = context.coordinator
        
        return pageVCtrlr
    }
    
    func updateUIViewController(_ pgVCtrlr: UIPageViewController, context: Context) {
        pgVCtrlr.setViewControllers(
            [ctrlrs[currentPage]], direction: .forward, animated: true
        )
    }
    
    class Coordinator: NSObject, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
        var parent: PageVC
        
        init(_ pgVC: PageVC) {
            self.parent = pgVC
        }
        
        func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) ->       UIViewController? {
            guard let idx = parent.ctrlrs.firstIndex(of: viewController) else {
                return nil
            }
            if idx == 0 {
                return parent.ctrlrs.last
            }
            return parent.ctrlrs[idx - 1]
        }
        
        func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
            guard let idx = parent.ctrlrs.firstIndex(of: viewController) else {
                return nil
            }
            if idx + 1 == parent.ctrlrs.count {
                return parent.ctrlrs.first
            }
            return parent.ctrlrs[idx + 1]
        }
        
        func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
            if completed
                , let visibleVC = pageViewController.viewControllers?.first
                , let idx = parent.ctrlrs.firstIndex(of: visibleVC) {
                parent.currentPage = idx
            }
        }
    }
}

