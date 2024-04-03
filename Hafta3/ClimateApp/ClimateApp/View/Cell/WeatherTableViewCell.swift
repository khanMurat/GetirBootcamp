//
//  WeatherTableViewCell.swift
//  ClimateApp
//
//  Created by Murat on 2.04.2024.
//

import UIKit

class WeatherTableViewCell: UITableViewCell {

    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
        
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(with model : WeatherModel){
                
        cityNameLabel.text = model.name
        temperatureLabel.text = String(format: "%0.1f °C", model.main.tempMax)
        let conditionName = conditionName(id: model.weather.first?.id ?? 200)
        conditionImageView.image = UIImage(systemName: conditionName)
    }
    
    func conditionName(id:Int) -> String {
        switch id {
        case 200...232:
            return "cloud.bolt"
        case 300...321:
            return "cloud.drizzle"
        case 500...531:
            return "cloud.rain"
        case 600...622:
            return "cloud.snow"
        case 701...781:
            return "cloud.fog"
        case 800:
            return "sun.max"
        case 801...804:
            return "cloud.bolt"
        default:
            return "cloud"
        }
    }
}
