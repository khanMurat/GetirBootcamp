//
//  UIViewControllerEx.swift
//  HWSearch
//
//  Created by Murat on 19.03.2024.
//

import Foundation
import UIKit

extension UIViewController {
    
    //MARK: - // Customiza Back Button
    
    func backButton() {
        
        let icon = UIImage(systemName: "arrow.left")!.withRenderingMode(.alwaysTemplate)
        let backItem = UIBarButtonItem(image: icon, style: .plain, target: self, action: #selector(back))
        backItem.tintColor = .lightGray
        self.navigationItem.leftBarButtonItem = backItem
    }
    
    @objc func back(){
        UIApplication.findTopViewController()?.navigationController?.popViewController(animated: true)
    }

    // MARK: Show Alert
    func showAlert(title: String? = "OK", message: String?, buttonAction: @escaping (() -> Void)) {
        let alert = UIAlertController.init(title: title, message: message, preferredStyle: .alert)
        let okayAction = UIAlertAction.init(title: "OK", style: .default) { action in
            buttonAction()
        }
        alert.addAction(okayAction)
        self.present(alert, animated: true, completion: nil)
    }

    func showErrorAlert(message: String?,completion: (()->Void)? = nil) {
        let alert = UIAlertController.init(title: "Error", message: message, preferredStyle: .alert)
        let okayAction = UIAlertAction.init(title: "OK", style: .destructive) { _ in
            completion?()
        }
        alert.addAction(okayAction)
        self.present(alert, animated: true, completion: nil)
    }
}
