//
//  OnboardingCollectionViewCell.swift
//
//  OnboardingExample
//
//  Created by Murat on 4.04.2024.
//


import UIKit

class OnboardingCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var boldDescription: UILabel!
    
    @IBOutlet weak var thinDescription: UILabel!
    
    @IBOutlet weak var onboardingImage: UIImageView!
        
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCell(onboarding : Onboarding?) {
        if let onboarding = onboarding {
            self.boldDescription.text = onboarding.title
            self.thinDescription.text = onboarding.description
            self.onboardingImage.image = onboarding.image
        }
    }
}
