//
//  ApiService.swift
//  ClimateApp
//
//  Created by Murat on 2.04.2024.
//

import Foundation
import RxSwift
import RxMoya
import Moya

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

struct WeatherServiceManager {
    
    static let shared = WeatherServiceManager()
    
    private let provider = MoyaProvider<WeatherService>()
    
    func getWeather(for latitude : Double,for longitude : Double) -> Single<WeatherModel> {
        
        return provider.rx
            .request(.getWeather(latitude, longitude))
            .filterSuccessfulStatusAndRedirectCodes()
            .map(WeatherModel.self)
    }
    
}
