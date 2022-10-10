//
//  DishDetailsViewController.swift
//  Yummie
//
//  Created by Andrew Emad on 07/10/2022.
//

import UIKit
import ProgressHUD

class DishDetailsViewController: UIViewController {

    @IBOutlet weak var inputTextField: UITextField!
    @IBOutlet weak var fullDescriptionLabel: UILabel!
    @IBOutlet weak var dishImageView: UIImageView!
    @IBOutlet weak var dishName: UILabel!
    @IBOutlet weak var caloriesLabel: UILabel!
    @IBOutlet weak var placeOrderButton: UIButton!
    
    var currentDish : Dish!
    var isComeFromOrders : Bool!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        if isComeFromOrders{
            inputTextField.isHidden = true
            placeOrderButton.isHidden = true
        }
    }

    private func setup(){
        dishName.text = currentDish.name
        caloriesLabel.text = currentDish.formattedCaloriy
        fullDescriptionLabel.text = currentDish.description
        dishImageView.kf.setImage(with: currentDish.image?.toURl)
    }
    
    private func placeOrder(dishID: String, name: String){
        ProgressHUD.show()
        NetworkService.shared.placeOrder(dishID: dishID, name: name){ result in
            switch result{
            case .failure(let error):
                ProgressHUD.showError(error.localizedDescription)
            case .success(_):
                ProgressHUD.dismiss()
            }
        }
        DispatchQueue.main.async {
            self.inputTextField.text = nil
        }
    }
    
    @IBAction func placeOrderClicked(_ sender: UIButton) {
        guard let name = inputTextField.text else{return}
        placeOrder(dishID: currentDish.id!, name: name)
    }
}
