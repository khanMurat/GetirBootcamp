//
//  CommentCell.swift
//  MVVM-C-Programmatic
//
//  Created by Kerim Çağlar on 31.03.2024.
//

import Foundation
import UIKit

class CommentCell: UITableViewCell {
    
    
    lazy var title: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.systemFont(ofSize: 16)
        lbl.numberOfLines = 0
        lbl.sizeToFit()
        return lbl
    }()
    
    lazy var body: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.systemFont(ofSize: 13)
        lbl.textColor = .lightGray
        lbl.numberOfLines = 0
        lbl.sizeToFit()
        return lbl
    }()
        
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none
 
        setContraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setContraints() {
        title.translatesAutoresizingMaskIntoConstraints = false
        body.translatesAutoresizingMaskIntoConstraints = false

        
        addSubview(title)
        addSubview(body)
        
        NSLayoutConstraint.activate([
            title.centerXAnchor.constraint(equalTo: centerXAnchor),
            title.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 8),
            title.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            body.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 8),
            body.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),

        ])
    }
    
    func configure(comment: Comment) {
        title.text = comment.name
        body.text = comment.body
    }
}


