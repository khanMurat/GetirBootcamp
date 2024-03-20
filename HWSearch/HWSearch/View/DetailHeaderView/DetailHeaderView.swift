//
//  DetailHeaderView.swift
//  HWSearch
//
//  Created by Murat on 19.03.2024.
//

import Foundation
import UIKit


class DetailHeaderView : UIView {
    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var wordNameLabel: UILabel!
    @IBOutlet weak var phoneticLabel: UILabel!
    
    //MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureXib()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureXib()
    }
    
    func configureHeaderView(viewModel:DetailHeaderViewModel?){
        
        guard let viewModel = viewModel else {return}
        wordNameLabel.text = viewModel.wordName
        phoneticLabel.text = viewModel.phonetic
    }
}

//MARK: - Configuration

private extension DetailHeaderView {

    func configureXib() {
        let bundle = Bundle(for: DetailHeaderView.self)
        contentView = UINib(nibName: DetailHeaderView._id, bundle: bundle).instantiate(withOwner: self).first as? UIView
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        contentView.frame = bounds
        addSubview(contentView)
    }
}

