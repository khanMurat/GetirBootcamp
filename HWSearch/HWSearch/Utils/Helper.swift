//
//  Helper.swift
//  HWSearch
//
//  Created by Murat on 18.03.2024.
//


import Foundation
import UIKit
import ProgressHUD

class Helper {

    class func showLoader(isLoading: Bool = true) {
        if isLoading {
        ProgressHUD.showIndicator()
        } else {
        ProgressHUD.dismiss()
        }
    }
}

