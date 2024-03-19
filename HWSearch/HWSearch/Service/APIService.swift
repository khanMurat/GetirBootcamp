//
//  APIService.swift
//  HWSearch
//
//  Created by Murat on 18.03.2024.
//

import Foundation
import Alamofire

class APIService {

    static func fetchData(word:String,completion: @escaping (Result<[WordDefinition], NetworkError>) -> Void) {
        
        guard let url = URL(string: "\(Constants.URL_DICTIONARY)\(word)") else {
            completion(.failure(.invalidURL))
            return
        }
        
        AF.request(url, method: .get).responseData { response in
            switch response.result {
            case .success(let data):
                let decoder = JSONDecoder()
                do {
                    let definition = try decoder.decode([WordDefinition].self, from: data)
                    completion(.success(definition))
                } catch {
                    completion(.failure(.parsingError))
                }
            case .failure:
                completion(.failure(.unknown))
            }
        }
    }
    
    static func fetchSynonyms(word:String,completion: @escaping (Result<[SynonymModel], NetworkError>) -> Void) {
        
        guard let url = URL(string: "\(Constants.URL_SYNONYM)\(word)") else {
            completion(.failure(.invalidURL))
            return
        }
        
        AF.request(url, method: .get).responseData { response in
            switch response.result {
            case .success(let data):
                let decoder = JSONDecoder()
                do {
                    let synonyms = try decoder.decode([SynonymModel].self, from: data)
                    completion(.success(synonyms))
                } catch {
                    completion(.failure(.parsingError))
                }
            case .failure:
                completion(.failure(.unknown))
            }
        }
    }
}
