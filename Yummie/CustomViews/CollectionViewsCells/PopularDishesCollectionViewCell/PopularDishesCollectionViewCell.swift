//
//  PopularDishesCollectionViewCell.swift
//  Yummie
//
//  Created by Andrew Emad on 07/10/2022.
//

import UIKit

class PopularDishesCollectionViewCell: UICollectionViewCell {

    static let identifier = String(describing: PopularDishesCollectionViewCell.self)
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dishImageView: UIImageView!
    @IBOutlet weak var caloriesLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setup(dish : Dish){
        titleLabel.text = dish.name
        caloriesLabel.text = dish.formattedCaloriy
        descriptionLabel.text = dish.description
        dishImageView.kf.setImage(with: dish.image?.toURl)
    }
    
}
