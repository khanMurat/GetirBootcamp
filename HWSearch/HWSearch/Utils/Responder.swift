//
//  Responder.swift
//  HWSearch
//
//  Created by Murat on 18.03.2024.
//

import Foundation
import UIKit

extension UIResponder {
    
    static var _id: String {
        return String(describing: self)
    }
}
