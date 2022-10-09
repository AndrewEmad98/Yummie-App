//
//  DishListTableViewCell.swift
//  Yummie
//
//  Created by Andrew Emad on 09/10/2022.
//

import UIKit

class DishListTableViewCell: UITableViewCell {

    static let identifier = String(describing: DishListTableViewCell.self)
    
    @IBOutlet weak var dishImageView: UIImageView!
    @IBOutlet weak var dishNameLabel: UILabel!
    @IBOutlet weak var dishDescriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setup(dish: Dish){
        dishImageView.kf.setImage(with: dish.image?.toURl)
        dishNameLabel.text = dish.name
        dishDescriptionLabel.text = dish.description
    }
    
    func setup(order : Order){
        dishImageView.kf.setImage(with: order.dish?.image?.toURl)
        dishNameLabel.text = order.dish?.name
        dishDescriptionLabel.text = order.name!
    }
}
