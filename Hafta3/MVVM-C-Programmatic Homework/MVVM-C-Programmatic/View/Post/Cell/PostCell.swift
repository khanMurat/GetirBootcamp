//
//  PostCell.swift
//  MVVM-C-Programmatic
//
//  Created by Kerim Çağlar on 31.03.2024.
//

import UIKit

class PostCell: UITableViewCell {
    
    var showBtnHandler: ((Int?) -> Void)?
    
    var post : Post?
    
    lazy var title: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.systemFont(ofSize: 16)
        lbl.numberOfLines = 0
        lbl.sizeToFit() // ne işe yarar -> bulunduğu view'a ve constraintlerine göre en uygun şekilde sığmayı sağlar diyebiliriz.
        return lbl
    }()
    
    lazy var body: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.systemFont(ofSize: 13)
        lbl.textColor = .lightGray
        lbl.numberOfLines = 0
        lbl.sizeToFit() // ne işe yarar
        return lbl
    }()
    
    var showMoreBtn: UIButton = {
       let btn = UIButton()
        btn.setTitle("Show more", for: .normal)
        btn.backgroundColor = .systemBlue
        btn.addTarget(self, action: #selector(handleShowMoreButtonPressed), for: .touchUpInside)
        return btn
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none
 
        setContraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func handleShowMoreButtonPressed(){
        
        if let post = post {
            
            showBtnHandler?(post.id)
        }
    }
    
    func setContraints() {
        title.translatesAutoresizingMaskIntoConstraints = false
        body.translatesAutoresizingMaskIntoConstraints = false
        showMoreBtn.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(title)
        addSubview(body)
        addSubview(showMoreBtn)
        
        NSLayoutConstraint.activate([
            title.centerXAnchor.constraint(equalTo: centerXAnchor),
            title.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 8),
            title.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            body.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 8),
            body.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            showMoreBtn.topAnchor.constraint(equalTo: body.bottomAnchor, constant: 8),
            showMoreBtn.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            showMoreBtn.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8)
        ])
    }
    
    func configure(post: Post) {
        title.text = post.title
        body.text = post.body
    }
}

// Ödev: User cell ve Comment cell yazılacak
// İlk ekranda, Userlar isimleri ile listelenecek
// Tıklanan userdan sonra, posts ekranı açılacak
// Postlarda açılan ekranda herhangi bir posta tıklanırsa onun comments leri açılacak

