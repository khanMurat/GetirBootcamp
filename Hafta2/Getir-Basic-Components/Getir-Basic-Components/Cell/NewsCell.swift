//
//  NewsCell.swift
//  Getir-Basic-Components
//
//  Created by Kerim Çağlar on 23.03.2024.
//

import UIKit

class NewsCell: UICollectionViewCell {
    
    @IBOutlet weak var newsImageView: UIImageView!
    @IBOutlet weak var newsTitleView: UILabel!
    @IBOutlet weak var newsDetailView: UILabel!
    
    func setup(model: News) {
        newsImageView.image = model.imageView
        newsTitleView.text = model.title
        newsDetailView.text = model.detail
    }
}
