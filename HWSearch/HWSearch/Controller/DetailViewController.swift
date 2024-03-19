//
//  DetailViewController.swift
//  HWSearch
//
//  Created by Murat on 18.03.2024.
//

import UIKit

class DetailViewController: UIViewController {
    
    //MARK: - Outlets
    
    //MARK: - Properties
    
    var word : String?
    private let viewModel = DetailViewModel()
    
    //MARK: - Lifecyle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getData()
        backButton()
    }
    
    func getData(){
        
        Helper.showLoader(isLoading: true)
        
        guard let word = word else {return}
        
        viewModel.getDataAboutWord(word: word) { result in
            switch result {
            case .success(let data):
                print(data[0].phonetic)
                Helper.showLoader(isLoading: false)
            case .failure(let error):
                self.showErrorAlert(message: error.title) {
                    self.navigationController?.popViewController(animated: true)
                }
                Helper.showLoader(isLoading: false)
            }
        }
    }
}
