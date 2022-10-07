//
//  DishDetailsViewController.swift
//  Yummie
//
//  Created by Andrew Emad on 07/10/2022.
//

import UIKit

class DishDetailsViewController: UIViewController {

    @IBOutlet weak var inputTextField: UITextField!
    @IBOutlet weak var fullDescriptionLabel: UILabel!
    @IBOutlet weak var dishImageView: UIImageView!
    @IBOutlet weak var dishName: UILabel!
    @IBOutlet weak var caloriesLabel: UILabel!
    
    var currentDish : Dish!
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    private func setup(){
        dishName.text = currentDish.name
        caloriesLabel.text = currentDish.formattedCaloriy
        fullDescriptionLabel.text = currentDish.description
        dishImageView.kf.setImage(with: currentDish.image?.toURl)
    }
    
    @IBAction func placeOrderClicked(_ sender: UIButton) {
    }
}
