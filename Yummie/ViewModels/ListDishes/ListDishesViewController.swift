//
//  ListDishesViewController.swift
//  Yummie
//
//  Created by Andrew Emad on 09/10/2022.
//

import UIKit

class ListDishesViewController: UIViewController {

    @IBOutlet weak var listDishesTableView: UITableView!
    var categoryDishes : [Dish]!
    var category : String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = category
        registerCell()
    }
    private func registerCell(){
        listDishesTableView.register(UINib(nibName: DishListTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: DishListTableViewCell.identifier)
    }
}

//MARK: - Table View Methods
extension ListDishesViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoryDishes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DishListTableViewCell.identifier, for: indexPath) as! DishListTableViewCell
        cell.setup(dish: categoryDishes[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailsVC = DishDetailsViewController.instantiate()
        detailsVC.currentDish = categoryDishes[indexPath.row]
        navigationController?.pushViewController(detailsVC, animated: true)
    }
    
}
