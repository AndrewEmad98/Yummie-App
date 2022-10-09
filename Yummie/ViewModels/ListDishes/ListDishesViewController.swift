//
//  ListDishesViewController.swift
//  Yummie
//
//  Created by Andrew Emad on 09/10/2022.
//

import UIKit

class ListDishesViewController: UIViewController {

    @IBOutlet weak var listDishesTableView: UITableView!
    var categoryDishes : [Dish] = [
        .init(id: "id1", name: "Koshri", description: "this is the traditional dish in egypt this is the traditional dish in egypt this is the traditional dish in egypt this is the traditional dish in egypt this is the traditional dish in egypt this is the traditional dish in egypt this is the traditional dish in egypt this is the traditional dish in egypt", image: "https://picsum.photos/200/300", calories: 200),
        .init(id: "id2", name: "Tagen", description: "this is a popular dish in egypt", image: "https://picsum.photos/200/300", calories: 300),
        .init(id: "id3", name: "Fool", description: "this is a popular dish in egypt", image: "https://picsum.photos/200/300", calories: 200)
    ]
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