//
//  HomeViewController.swift
//  Yummie
//
//  Created by Andrew Emad on 05/10/2022.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var chefsSpecialsCollectionView: UICollectionView!
    @IBOutlet weak var popularDishesCollectionView: UICollectionView!
    @IBOutlet weak var foodCategoryCollectionView: UICollectionView!
    
    var categories : [DishCategory] = [
        .init(id: "id1", name: "Egypt dishes1", image: "https://picsum.photos/200/300"),
        .init(id: "id2", name: "Egypt dishes2", image: "https://picsum.photos/200/300"),
        .init(id: "id3", name: "Egypt dishes3", image: "https://picsum.photos/200/300"),
        .init(id: "id4", name: "Egypt dishes4", image: "https://picsum.photos/200/300"),
        .init(id: "id4", name: "Egypt dishes5", image: "https://picsum.photos/200/300")
    ]
    var popularDishes : [Dish] = [
        .init(id: "id1", name: "Koshri", description: "this is the traditional dish in egypt this is the traditional dish in egypt this is the traditional dish in egypt this is the traditional dish in egypt this is the traditional dish in egypt this is the traditional dish in egypt this is the traditional dish in egypt this is the traditional dish in egypt", image: "https://picsum.photos/200/300", calories: 200),
        .init(id: "id2", name: "Tagen", description: "this is a popular dish in egypt", image: "https://picsum.photos/200/300", calories: 300),
        .init(id: "id3", name: "Fool", description: "this is a popular dish in egypt", image: "https://picsum.photos/200/300", calories: 200)
    ]
    
    var chefSpecialDishes : [Dish] = [
        .init(id: "id1", name: "Koshri", description: "this is the traditional dish in egypt", image: "https://picsum.photos/200/300", calories: 200),
        .init(id: "id2", name: "Tagen", description: "this is a popular dish in egypt", image: "https://picsum.photos/200/300", calories: 300),
        .init(id: "id3", name: "Fool", description: "this is a popular dish in egypt", image: "https://picsum.photos/200/300", calories: 200)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerNibFiles()
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
            var categoryDishes : [Dish] = []
            let listDishesVC = ListDishesViewController.instantiate()
            for dish in popularDishes {
                if dish.id == currentCategory.id {
                    categoryDishes.append(dish)
                }
            }
            listDishesVC.categoryDishes = categoryDishes
            listDishesVC.category = currentCategory.name
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
