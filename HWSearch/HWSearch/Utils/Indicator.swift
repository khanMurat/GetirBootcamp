//
//  Indicator.swift
//  HWSearch
//
//  Created by Murat on 18.03.2024.
//

import Foundation
import UIKit
import ProgressHUD

extension ProgressHUD {

    class func showIndicator() {
        ProgressHUD.show(interaction: false)
        ProgressHUD.colorAnimation = .systemBlue
        ProgressHUD.animationType = .circleRotateChase
    }
    
    class func dismissIndicator() {
        ProgressHUD.dismiss()
    }
}

extension UITableView {

    private func indicatorView() -> UIActivityIndicatorView {
        var activityIndicatorView = UIActivityIndicatorView()
        if self.tableFooterView == nil {
            let indicatorFrame = CGRect(x: 0, y: 0, width: self.bounds.width, height: 80)
            activityIndicatorView = UIActivityIndicatorView(frame: indicatorFrame)
            activityIndicatorView.autoresizingMask = [.flexibleLeftMargin, .flexibleRightMargin]

            if #available(iOS 13.0, *) {
                activityIndicatorView.style = .medium
            } else {
                // Fallback on earlier versions
                activityIndicatorView.style = .medium
            }

            activityIndicatorView.color = .gray
            activityIndicatorView.hidesWhenStopped = true

            self.tableFooterView = activityIndicatorView
            return activityIndicatorView
        } else {
            return activityIndicatorView
        }
    }

    func addLoading(_ indexPath: IndexPath, closure: @escaping (() -> Void)) {
        if let lastVisibleIndexPath = self.indexPathsForVisibleRows?.last, indexPath == lastVisibleIndexPath && indexPath.row == self.numberOfRows(inSection: 0) - 1 {
            indicatorView().startAnimating()
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                closure()
            }
        }
    }

    func stopLoading() {
        guard let tableFooterView else { return }
        self.indicatorView().stopAnimating()
        self.tableFooterView = nil
    }
}
