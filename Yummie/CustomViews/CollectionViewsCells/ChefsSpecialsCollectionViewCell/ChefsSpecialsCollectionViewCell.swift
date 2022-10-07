//
//  ChefsSpecialsCollectionViewCell.swift
//  Yummie
//
//  Created by Andrew Emad on 07/10/2022.
//

import UIKit

class ChefsSpecialsCollectionViewCell: UICollectionViewCell {

    static let identifier = String(describing: ChefsSpecialsCollectionViewCell.self)
    
    @IBOutlet weak var chefSpecialImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var caloriesLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func setup(dish : Dish){
        chefSpecialImageView.kf.setImage(with: dish.image?.toURl)
        titleLabel.text = dish.name
        descriptionLabel.text = dish.description
        caloriesLabel.text = dish.formattedCaloriy
    }
}
