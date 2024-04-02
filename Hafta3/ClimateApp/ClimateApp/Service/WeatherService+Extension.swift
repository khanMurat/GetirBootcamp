//
//  WeatherService+Extension.swift
//  ClimateApp
//
//  Created by Murat on 2.04.2024.
//

import Foundation
import Moya

extension WeatherService : TargetType {
    
    var baseURL: URL {
        return URL(string: "https://api.openweathermap.org/data/2.5/weather")!
    }
    
    var path: String {
        
        switch self {
        case .getWeather(let latitude,let longitude):
            return "/lat=\(latitude)&lon=\(longitude)&appid=a99178578bf98e8e6f305d08df74a477&units=metric"
        }
    }
    
    var method: Moya.Method {
        .get
    }
    
    var task: Moya.Task {
        .requestPlain
    }
    
    var headers: [String : String]? {
        return ["Content-type" : "application/json"]
    }
    
}
