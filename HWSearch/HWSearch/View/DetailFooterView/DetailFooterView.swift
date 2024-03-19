//
//  DetailFooterView.swift
//  HWSearch
//
//  Created by Murat on 19.03.2024.
//

import Foundation
import UIKit


class DetailFooterView : UIView {
    
    //MARK: - Outlets
    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    //MARK: - Properties
    
    var synonyms = [SynonymModel]()
    
    //MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureXib()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureXib()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return synonyms.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell : FooterCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "FooterCollectionViewCell", for: indexPath) as! FooterCollectionViewCell
        let synonym = synonyms[indexPath.row]
        cell.synonymLabel.text = synonym.word
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 12
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let synonym = synonyms[indexPath.row]
        let labelWidth: CGFloat = synonym.word.size(withAttributes: [.font: UIFont.systemFont(ofSize: 13)]).width
        let width: CGFloat = labelWidth + 25
        return CGSize(width: width, height: 40)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 18
    }
}

//MARK: - Configuration

private extension DetailFooterView {

    func configureXib() {
        let bundle = Bundle(for: DetailFooterView.self)
        contentView = UINib(nibName: DetailFooterView._id, bundle: bundle).instantiate(withOwner: self).first as? UIView
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        contentView.frame = bounds
        addSubview(contentView)
    }
}

