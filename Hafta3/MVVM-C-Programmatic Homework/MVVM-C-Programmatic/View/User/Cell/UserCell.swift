//
//  UserCell.swift
//  MVVM-C-Programmatic
//
//  Created by Murat on 4.04.2024.
//

import Foundation
import UIKit


class UserCell : UITableViewCell {
    
    lazy var title: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.systemFont(ofSize: 18)
        lbl.numberOfLines = 0
        lbl.sizeToFit()
        return lbl
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none
        accessoryType = .disclosureIndicator
        
        setContraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setContraints() {
        title.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(title)
        
        NSLayoutConstraint.activate([
            title.centerXAnchor.constraint(equalTo: centerXAnchor),
            title.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 8),
            title.topAnchor.constraint(equalTo: topAnchor, constant: 8),
        ])
    }
    
    func configure(user: User) {
        title.text = user.name
    }
    
}
