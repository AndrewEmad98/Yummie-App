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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerNibFiles()
    }
    private func registerNibFiles(){
        foodCategoryCollectionView.register(UINib(nibName: CategoryCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: CategoryCollectionViewCell.identifier)
    }
}

//MARK: - collectionView Methods
extension HomeViewController : UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case foodCategoryCollectionView:
            return categories.count
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case foodCategoryCollectionView :
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identifier, for: indexPath) as! CategoryCollectionViewCell
            cell.setup(category: categories[indexPath.row])
            return cell
        default:
            return UICollectionViewCell()
        }
    }
    
}
