//
//  OnboardingModel.swift
//  OnboardingExample
//
//  Created by Murat on 4.04.2024.
//

import Foundation
import UIKit

class Onboarding {

    var title: String?
    var description: String?
    var image: UIImage?

    init(title: String? = nil, description: String? = nil, image: UIImage? = nil) {
        self.title = title
        self.description = description
        self.image = image
    }

    static func preview() -> [Onboarding] {
        [
            Onboarding(title: "Add your cards and bank accounts to see financial details", description: "See your financial details in the app.To save your money", image: UIImage(named: "onboarding1-image")),

            Onboarding(title: "Add your cards and bank accounts to see financial details", description: "See your financial details in the app.To save your money", image: UIImage(named: "onboarding2-image")),

            Onboarding(title: "Add your cards and bank accounts to see financial details", description: "See your financial details in the app.To save your money", image: UIImage(named: "onboarding3-image")),
        ]
    }
}
