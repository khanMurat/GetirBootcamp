//
//  DetailViewModel.swift
//  HWSearch
//
//  Created by Murat on 19.03.2024.
//

import Foundation

protocol DetailViewModelDelegate: AnyObject {
    func didReceiveHeaderData(_ viewModel: DetailHeaderViewModel)
    func didReceiveFooterData(_ footerData: [SynonymModel])
    func didReceiveTableData(_ meanings : [Meaning])
    func didFailWithError(_ error: NetworkError)
}

class DetailViewModel {
    
    weak var delegate: DetailViewModelDelegate?
    
    func getDataAboutWord(word: String) {
        let dispatchGroup = DispatchGroup()
        
        var wordDefinition: [WordDefinition]?
        var synonyms: [SynonymModel]?
        
        Helper.showLoader(isLoading: true)
        
        dispatchGroup.enter()
        APIService.fetchData(word: word) { result in
            switch result {
            case .success(let definition):
                wordDefinition = definition
            case .failure(let error):
                self.delegate?.didFailWithError(error)
                Helper.showLoader(isLoading: false)
            }
            dispatchGroup.leave()
        }
        
        dispatchGroup.enter()
        APIService.fetchSynonyms(word: word) { result in
            switch result {
            case .success(let synonymModels):
                synonyms = synonymModels
            case .failure(let error):
                self.delegate?.didFailWithError(error)
                Helper.showLoader(isLoading: false)
            }
            dispatchGroup.leave()
        }
        
        dispatchGroup.notify(queue: .main) {
            if let wordDefinition = wordDefinition {
                let headerData = DetailHeaderViewModel(model: wordDefinition[0])
                self.delegate?.didReceiveHeaderData(headerData)
                self.delegate?.didReceiveTableData(wordDefinition[0].meanings)
            }
            
            if var synonyms = synonyms {
                synonyms = synonyms.sorted(by: { $0.score < $1.score })
                let first5 = Array(synonyms.prefix(5))
                let footerData = first5
                self.delegate?.didReceiveFooterData(footerData)
            }
        }
        Helper.showLoader(isLoading: false)
    }
}

