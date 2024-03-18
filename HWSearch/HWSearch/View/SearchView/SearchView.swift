//
//  SearchView.swift
//  HWSearch
//
//  Created by Murat on 18.03.2024.
//

import Foundation
import UIKit

protocol SearchDelegate {
    func didSearchPressed(_ view : SearchView,searchBegin:Bool)
    
}

class SearchView : UIView {
    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var searchTextField: UITextField!
    
    //MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureXib()
        configureUI()
        
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureXib()
        configureUI()
    }
    
    @IBAction func searchTextFieldView(_ sender: Any) {
        
        
        
    }
    
    //MARK: - Helpers
    
    func configureUI(){
        self.stackView.layer.cornerRadius = 5
        self.stackView.layer.borderColor = UIColor.systemGray5.cgColor
        self.stackView.layer.borderWidth = 1.0
    }
    
}

//MARK: - Configuration

private extension SearchView {

    func configureXib() {
        let bundle = Bundle(for: SearchView.self)
        contentView = UINib(nibName: SearchView._id, bundle: bundle).instantiate(withOwner: self).first as? UIView
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        contentView.frame = bounds
        addSubview(contentView)
    }
}
