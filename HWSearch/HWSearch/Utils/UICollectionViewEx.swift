//
//  UICollectionViewEx.swift
//  HWSearch
//
//  Created by Murat on 20.03.2024.
//

import Foundation
import UIKit.UICollectionView

extension UICollectionView {

    //MARK: Register
    var registerCell: UICollectionViewCell.Type {
        set {
            self.register(UINib.init(nibName: newValue.self._id, bundle: nil), forCellWithReuseIdentifier: newValue.self._id)
        }
        get {
            return UICollectionViewCell.self
        }
    }

    //MARK: Dequeue
    func dequeueReusableCell<T: UICollectionViewCell>(withClass name: T.Type = T.self, for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withReuseIdentifier: name._id, for: indexPath) as? T else {
            fatalError("Couldn't find UICollectionViewCell for \(name._id), make sure the cell is registered with collection view")
        }
        return cell
    }
    
    var registerHeader: UICollectionReusableView.Type {
        get {
            return UICollectionReusableView.self
        }
        set {
            self.register(newValue, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: newValue.self._id)
        }
    }

    func scrollToNextItem()  {
        let contentOffset = CGFloat(floor(self.contentOffset.x + self.bounds.size.width))
        self.moveToFrame(contentOffset: contentOffset)
    }

    func moveToFrame(contentOffset: CGFloat) {
        self.setContentOffset(CGPoint(x: contentOffset, y: self.contentOffset.y), animated: true)
        print("2222>>>>>\(contentOffset)")

    }
    
    func dequeueReusableHeaderView<T: UICollectionReusableView>(withClass name: T.Type, for indexPath: IndexPath) -> T {
        guard let header = dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: name._id, for: indexPath) as? T else {
            fatalError("Couldn't find UICollectionReusableView for \(name._id), make sure the cell is registered with collection view")
        }
        return header

    }
}
