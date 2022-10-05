//
//  OnboardingViewController.swift
//  Yummie
//
//  Created by Andrew Emad on 04/10/2022.
//

import UIKit

class OnboardingViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var button: UIButton!
    
    var slides : [OnboardingSlide] = []
    var currentPage : Int = 0 {
        didSet{
            if currentPage == slides.count - 1 {
                button.setTitle("Get Started", for: .normal)
            }else {
                button.setTitle("Next", for: .normal)
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        slides = [
                    OnboardingSlide(title: "Delicious Dishes", description: "Experience a variety of amazing dishes from different cultures around the world.", image: #imageLiteral(resourceName: "slide2")),
                    OnboardingSlide(title: "World-Class Chefs", description: "Our dishes are prepared by only the best.", image: #imageLiteral(resourceName: "slide1")),
                    OnboardingSlide(title: "Instant World-Wide Delivery", description: "Your orders will be delivered instantly irrespective of your location around the world.", image: #imageLiteral(resourceName: "slide3"))
        ]
        collectionView.delegate = self
        collectionView.dataSource = self
        pageControl.numberOfPages = slides.count
    }
    
    @IBAction func nextButtonClicked(_ sender: UIButton) {
        if currentPage == slides.count - 1 {
            // go to home page
            let homeNC = storyboard?.instantiateViewController(withIdentifier: "HomeNC") as! UINavigationController
            homeNC.modalPresentationStyle = .fullScreen
            homeNC.modalTransitionStyle = .flipHorizontal
            present(homeNC, animated: true)
            
        }else {
            currentPage += 1
            pageControl.currentPage = currentPage
            // scroll to next page
            let indexPath = IndexPath(item: currentPage, section: 0)
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }
    }
    
}

//MARK: - collection view delegate and data source methods
extension OnboardingViewController : UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return slides.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SlideCollectionViewCell.identifier, for: indexPath) as! SlideCollectionViewCell
        cell.setup(slide: slides[indexPath.row])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        let currentContentPosition = scrollView.contentOffset.x
        currentPage = Int(currentContentPosition / width)
        pageControl.currentPage = currentPage
    }

}
