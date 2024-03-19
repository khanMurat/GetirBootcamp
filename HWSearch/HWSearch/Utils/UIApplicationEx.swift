//
//  UIApplicationEx.swift
//  HWSearch
//
//  Created by Murat on 19.03.2024.
//

import Foundation
import UIKit

extension UIApplication {
    
    var currentWindow: UIWindow? {
        connectedScenes
            .filter({ $0.activationState == .foregroundActive })
            .map({ $0 as? UIWindowScene })
            .compactMap({ $0 })
            .first?.windows
            .filter({ $0.isKeyWindow }).first
    }
    
    class func findTopViewController(base: UIViewController? = UIApplication.shared.currentWindow?.rootViewController) -> UIViewController? {
        if let nav = base as? UINavigationController {
            return findTopViewController(base: nav.visibleViewController)
        }
        if let tab = base as? UITabBarController {
            if let selected = tab.selectedViewController {
                return findTopViewController(base: selected)
            }
        }

        if let presented = base?.presentedViewController {
            return findTopViewController(base: presented)
        }
        return base
    }
}
