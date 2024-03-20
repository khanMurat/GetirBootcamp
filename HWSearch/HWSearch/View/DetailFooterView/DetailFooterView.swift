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
        configureCollectionView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureXib()
        configureCollectionView()
    }
    
    func configureCollectionView(){
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.registerCell = FooterCollectionViewCell.self
    }
}

//MARK: - CollectionView

extension DetailFooterView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return synonyms.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: FooterCollectionViewCell = collectionView.dequeueReusableCell(for: indexPath)
        let synonym = synonyms[indexPath.row]
        cell.synonymLabel.text = synonym.word
        cell.configureUI()
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let totalSpacing : CGFloat = (3 * 8)
        let availableWidth = collectionView.frame.width - totalSpacing
        let widthPerItem = availableWidth / 4
        
        return CGSize(width: widthPerItem, height: 40)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 8
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

