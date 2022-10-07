//
//  CategoryCollectionViewCell.swift
//  Yummie
//
//  Created by Andrew Emad on 06/10/2022.
//

import UIKit
import Kingfisher

class CategoryCollectionViewCell: UICollectionViewCell {

    static let identifier = String(describing: CategoryCollectionViewCell.self)
    @IBOutlet weak var categoryTitleLabel: UILabel!
    @IBOutlet weak var categoryImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    func setup(category : DishCategory){
        categoryTitleLabel.text = category.name
        categoryImageView.kf.setImage(with: category.image?.toURl)
    }

}
