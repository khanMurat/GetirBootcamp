//
//  TableViewHelper.swift
//  Getir-Basic-Components
//
//  Created by Murat on 24.03.2024.
//

import Foundation
import UIKit

//MARK: - Handle Empty Data

extension UITableView {
    
    func setEmptyMessage(_ message: String) {
        let messageLabel = UILabel(frame: CGRect(x: 0, y: 0, width: self.bounds.size.width, height: self.bounds.size.height))
        messageLabel.text = message
        messageLabel.textColor = .black
        messageLabel.numberOfLines = 0
        messageLabel.textAlignment = .center
        messageLabel.font = .boldSystemFont(ofSize: 15)
        messageLabel.sizeToFit()
        
        UIView.animate(withDuration: 1.0) {
            self.backgroundView = messageLabel
            self.separatorStyle = .none
        }
    }
    
    func restore() {
            self.backgroundView = nil
            self.separatorStyle = .singleLine
    }
}
