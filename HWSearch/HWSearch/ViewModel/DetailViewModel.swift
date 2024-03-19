//
//  DetailViewModel.swift
//  HWSearch
//
//  Created by Murat on 19.03.2024.
//

import Foundation


class DetailViewModel {
    
    func getDataAboutWord(word:String,completion:@escaping (Result<[WordDefinition], NetworkError>) -> Void){
        
        APIService.fetchData(word: word, completion: completion)
    }
}
