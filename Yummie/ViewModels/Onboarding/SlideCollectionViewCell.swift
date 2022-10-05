//
//  SlideCollectionViewCell.swift
//  Yummie
//
//  Created by Andrew Emad on 04/10/2022.
//

import UIKit

class SlideCollectionViewCell: UICollectionViewCell {
    static let identifier: String = "SlideCollectionViewCell"
    @IBOutlet weak var sliderImage: UIImageView!
    @IBOutlet weak var sliderTitle: UILabel!
    @IBOutlet weak var sliderDescription: UILabel!
    
    func setup(slide: OnboardingSlide){
        sliderImage.image = slide.image
        sliderTitle.text = slide.title
        sliderDescription.text = slide.description
    }
}
