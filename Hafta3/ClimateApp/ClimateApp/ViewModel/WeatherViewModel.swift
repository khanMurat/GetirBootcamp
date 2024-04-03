//
//  HomeViewModel.swift
//  ClimateApp
//
//  Created by Murat on 2.04.2024.
//

import Foundation
import RxSwift
import RxMoya

class WeatherViewModel {
         
    func fetchWeather(with latitude : Double, with longitude : Double) -> Observable<WeatherModel> {
        return .create { observer in
            WeatherServiceManager.shared.getWeather(for: latitude, for: longitude)
                .subscribe { weathermodel in
                    print(weathermodel.name)
                    observer.onNext(weathermodel)
                } onFailure: { error in
                    print(error)
                    observer.onError(error)
                }
        }
    }
}
