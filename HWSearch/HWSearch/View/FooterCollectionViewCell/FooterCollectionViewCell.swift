//
//  FooterCollectionViewCell.swift
//  HWSearch
//
//  Created by Murat on 19.03.2024.
//

import UIKit

class FooterCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var synonymLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureUI(){
        self.layer.cornerRadius = 20
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.lightGray.cgColor
    }

}
