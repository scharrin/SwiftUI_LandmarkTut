import UIKit
import SwiftUI

struct ThmColr {
    static let grayDark1 = UIColor(red: 55, green: 50, blue: 47, alpha: 1)
    static let grayDark2 = UIColor(red: 74, green: 70, blue: 67, alpha: 1)
    static let brown1  = UIColor(red: 101, green: 60, blue: 38, alpha: 1)
}

struct Dims {
    struct Scrn {
//        static let W = UIScreen.main.bounds.width
//        static let H = UIScreen.main.bounds.height
    }
    struct Ratio {
        static let gldn = 1.618
//        static let limtMaxW =
//        static let limtMaxH =
    }
}

enum Env: String {
    case debug
    case testFlight
    case appStore
}

struct App {
    struct Folders {
        static let doc: NSString = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString
        static let tmp: NSString = NSTemporaryDirectory() as NSString
    }
    static let ver: String = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as! String
    static let buld: String = Bundle.main.object(forInfoDictionaryKey: "CFBundleVersion") as! String

    // This is private because the use of 'appConfiguration' is preferred.
    private static let isTestFlight = Bundle.main.appStoreReceiptURL?.lastPathComponent == "sandboxReceipt"

    // This can be used to add debug statements.
    static var isDebug: Bool {
        #if DEBUG
        return true
        #else
        return false
        #endif
    }

    static var env: Env {
        if isDebug {
            return .debug
        } else if isTestFlight {
            return .testFlight
        } else {
            return .appStore
        }
    }
}
