//
//  ListOrdersViewController.swift
//  Yummie
//
//  Created by Andrew Emad on 09/10/2022.
//

import UIKit

class ListOrdersViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var orders : [Order] = [
        .init(id: "id1", name: "Andrew", dish:
                .init(id: "id1", name: "Koshri", description: "this is the traditional dish in egypt this is the traditional dish in egypt this is the traditional dish in egypt this is the traditional dish in egypt this is the traditional dish in egypt this is the traditional dish in egypt this is the traditional dish in egypt this is the traditional dish in egypt", image: "https://picsum.photos/200/300", calories: 200))
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Orders"
        registerCells()
    }
    
    private func registerCells(){
        tableView.register(UINib(nibName: DishListTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: DishListTableViewCell.identifier)
    }

}

//MARK: - table view methods
extension ListOrdersViewController : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orders.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DishListTableViewCell.identifier, for: indexPath) as! DishListTableViewCell
        cell.setup(order: orders[indexPath.row])
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailsVC = DishDetailsViewController.instantiate()
        detailsVC.currentDish = orders[indexPath.row].dish!
        navigationController?.pushViewController(detailsVC, animated: true)
    }
}
