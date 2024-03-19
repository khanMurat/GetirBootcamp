//
//  DetailViewModel.swift
//  HWSearch
//
//  Created by Murat on 19.03.2024.
//

import Foundation

protocol DetailViewModelDelegate: AnyObject {
    func didReceiveHeaderData(_ viewModel: DetailHeaderViewModel)
    //func didReceiveFooterData(_ footerData: [String])
    func didReceiveTableData(_ meanings : [Meaning])
    func didFailWithError(_ error: NetworkError)
}

class DetailViewModel {
    
    weak var delegate: DetailViewModelDelegate?
    
    func getDataAboutWord(word: String) {
        let dispatchGroup = DispatchGroup()
        
        var wordDefinition: [WordDefinition]?
        var synonyms: [SynonymModel]?
        
        dispatchGroup.enter()
        APIService.fetchData(word: word) { result in
            switch result {
            case .success(let definition):
                wordDefinition = definition
            case .failure(let error):
                print(error.localizedDescription)
            }
            dispatchGroup.leave()
        }
        
        dispatchGroup.enter()
        APIService.fetchSynonyms(word: word) { result in
            switch result {
            case .success(let synonymModels):
                synonyms = synonymModels
            case .failure(let error):
                print(error.localizedDescription)
            }
            dispatchGroup.leave()
        }
        
        dispatchGroup.notify(queue: .main) {
            if let wordDefinition = wordDefinition {
                let headerData = DetailHeaderViewModel(model: wordDefinition[0])
                self.delegate?.didReceiveHeaderData(headerData)
                self.delegate?.didReceiveTableData(wordDefinition[0].meanings)
            }
            
            //            if let synonyms = synonyms {
            //                let footerData = DetailFooterViewModel(synonyms: synonyms.map { $0.word })
            //                self.delegate?.didReceiveFooterData(footerData)
            //            }
        }
    }
}

