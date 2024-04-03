//
//  ViewController.swift
//  ClimateApp
//
//  Created by Murat on 2.04.2024.
//

import UIKit
import RxSwift
import CoreLocation

class WeatherViewController: UIViewController,CLLocationManagerDelegate {
    
    //MARK: - Outlets
    
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: - Properties
    
    private let locationManager = CLLocationManager()
    private let disposeBag = DisposeBag()
    private var weathers: [WeatherModel] = []
    private var isInitialFetch : Bool = true
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLocationManager()
        setupTableView()
    }
    
    //MARK: - Helpers
    
    private func setupLocationManager() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard isInitialFetch else { return }
        
        if let location = locations.first {
            fetchWeatherData(for: location.coordinate.latitude, for: location.coordinate.longitude)
            isInitialFetch = false
            locationManager.stopUpdatingLocation()
        }
    }
    
    
    private func fetchWeatherData(for latitude:Double,for longitude:Double) {
        let viewModel = WeatherViewModel()
        viewModel.fetchWeather(with: latitude, with: longitude)
            .subscribe(onNext: { [weak self] weatherModel in
                self?.weathers.append(weatherModel)
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            }, onError: { error in
                print(error)
            }).disposed(by: disposeBag)
    }
    
    private func setupTableView(){
        self.tableView.register(UINib(nibName: "WeatherTableViewCell", bundle: nil), forCellReuseIdentifier: "WeatherTableViewCell")
        self.tableView.rowHeight = 250
    }
}

//MARK: - UITableViewDelegate,UITableViewDataSource

extension WeatherViewController :
    UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weathers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherTableViewCell", for: indexPath) as? WeatherTableViewCell else {
            fatalError("WeatherTableViewCell not found")
        }
        let weather = weathers[indexPath.row]
        cell.configure(with: weather)
        return cell
    }
    
}

