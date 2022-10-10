//
//  HomeViewController.swift
//  Yummie
//
//  Created by Andrew Emad on 05/10/2022.
//

import UIKit
import ProgressHUD

class HomeViewController: UIViewController {

    @IBOutlet weak var chefsSpecialsCollectionView: UICollectionView!
    @IBOutlet weak var popularDishesCollectionView: UICollectionView!
    @IBOutlet weak var foodCategoryCollectionView: UICollectionView!
    
    var categories : [DishCategory] = []
    var popularDishes : [Dish] = []
    var chefSpecialDishes : [Dish] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerNibFiles()
        fetchCategories()
    }
    
    private func fetchCategories(){
        ProgressHUD.show()
        NetworkService.shared.fetchCategoriesAPI{ [weak self] result in
            switch result{
            case .failure(let error):
                ProgressHUD.showError(error.localizedDescription)
            case .success(let data):
                ProgressHUD.dismiss()
                self?.categories = data.categories ?? []
                self?.popularDishes = data.populars ?? []
                self?.chefSpecialDishes = data.specials ?? []
                DispatchQueue.main.async {
                    self?.foodCategoryCollectionView.reloadData()
                    self?.chefsSpecialsCollectionView.reloadData()
                    self?.popularDishesCollectionView.reloadData()
                }
            }
        }
    }
    private func registerNibFiles(){
        foodCategoryCollectionView.register(UINib(nibName: CategoryCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: CategoryCollectionViewCell.identifier)
        popularDishesCollectionView.register(UINib(nibName: PopularDishesCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: PopularDishesCollectionViewCell.identifier)
        chefsSpecialsCollectionView.register(UINib(nibName: ChefsSpecialsCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: ChefsSpecialsCollectionViewCell.identifier)
    }

    
}

//MARK: - collectionView Methods
extension HomeViewController : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case foodCategoryCollectionView:
            return categories.count
        case popularDishesCollectionView:
            return popularDishes.count
        case chefsSpecialsCollectionView:
            return chefSpecialDishes.count
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case foodCategoryCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identifier, for: indexPath) as! CategoryCollectionViewCell
            cell.setup(category: categories[indexPath.row])
            return cell
        case popularDishesCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PopularDishesCollectionViewCell.identifier, for: indexPath) as! PopularDishesCollectionViewCell
            cell.setup(dish: popularDishes[indexPath.row])
            return cell
        case chefsSpecialsCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ChefsSpecialsCollectionViewCell.identifier, for: indexPath) as! ChefsSpecialsCollectionViewCell
            cell.setup(dish: chefSpecialDishes[indexPath.row])
            return cell
        default:
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == foodCategoryCollectionView {
            // go to category list screen
            let currentCategory = categories[indexPath.row]
            let listDishesVC = ListDishesViewController.instantiate()
            listDishesVC.category = currentCategory
            navigationController?.pushViewController(listDishesVC, animated: true)
        }else {
            let dishDetailsVC = DishDetailsViewController.instantiate()
            if collectionView == popularDishesCollectionView {
                dishDetailsVC.currentDish = popularDishes[indexPath.row]
            }else{
                dishDetailsVC.currentDish = chefSpecialDishes[indexPath.row]
            }
            navigationController?.pushViewController(dishDetailsVC, animated: true)
        }
    }
}
