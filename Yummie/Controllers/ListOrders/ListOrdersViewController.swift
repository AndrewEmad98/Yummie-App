//
//  ListOrdersViewController.swift
//  Yummie
//
//  Created by Andrew Emad on 09/10/2022.
//

import UIKit
import ProgressHUD

class ListOrdersViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var orders : [Order] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Orders"
        registerCells()
        fetchOrders()
    }
    private func fetchOrders(){
        ProgressHUD.show()
        NetworkService.shared.fetchOrders{ [weak self] result in
            switch result{
            case .failure(let error):
                ProgressHUD.showError(error.localizedDescription)
            case .success(let data):
                ProgressHUD.dismiss()
                self?.orders = data
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            }
        }
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
        detailsVC.isComeFromOrders = true
        navigationController?.pushViewController(detailsVC, animated: true)
    }
}
