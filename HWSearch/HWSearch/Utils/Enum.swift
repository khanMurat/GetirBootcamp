//
//  Enum.swift
//  HWSearch
//
//  Created by Murat on 18.03.2024.
//

import Foundation

enum NetworkError : Error {
    case invalidURL
    case noData
    case parsingError
    case unknown
    
    var title : String {
        switch self {
        case .invalidURL:
            return "Invalid URL!"
        case .noData:
            return "There is no result!"
        case .parsingError:
            return "Error occured when try to parse data!"
        case .unknown:
            return "There is an unknown error"
        }
    }
}
