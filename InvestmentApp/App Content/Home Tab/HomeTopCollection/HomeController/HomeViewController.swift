//
//  HomeViewController.swift
//  InvestmentApp
//
//  Created by WEMA on 07/02/2024.
//

import UIKit

class HomeViewController: UIViewController {
    
    var currentPage = 0
    var homeCellData: [HomeTopProperties] = HomeTopModel().populateData()

    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var topHomeCollection: UICollectionView!
    @IBOutlet weak var verificationUpdatesLabel: UILabel!
    @IBOutlet weak var verificationCollection: UICollectionView!
    @IBOutlet weak var verificationImageBelow: UIImageView!
    @IBOutlet var quickViews: [UIView]!
    @IBOutlet weak var recommendationViews: UICollectionView!
    @IBOutlet weak var quickActionsLabel: UILabel!
    @IBOutlet weak var recommendationLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //KeyboardUtility.addTapGestureToDismissKeyboard(for: self)
        
        for views in quickViews{
            views.backgroundColor = UIColor(red: 0.851, green: 0.851, blue: 0.851, alpha: 1)
            
            verificationUpdatesLabel.text = "Verification Updates"
            verificationUpdatesLabel.font = .systemFont(ofSize: 15, weight: .regular)
            
            quickActionsLabel.text = "Quick Actions"
            quickActionsLabel.font = .systemFont(ofSize: 15, weight: .regular)
            
            recommendationLabel.text = "Recommendations"
            recommendationLabel.font = .systemFont(ofSize: 15, weight: .regular)

        }
       
        
        verificationImageBelow.layer.backgroundColor = UIColor(red: 0.851, green: 0.851, blue: 0.851, alpha: 1).cgColor

        view.layer.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1).cgColor
        
        pageControl.currentPageIndicatorTintColor = UIColor(red: 0.404, green: 0.396, blue: 0.91, alpha: 1)
        pageControl.pageIndicatorTintColor = UIColor.lightGray
        
        topHomeCollection.tag = 1
        verificationCollection.tag = 2
        recommendationViews.tag = 3
        
        
        topHomeCollection.register(UINib(nibName: "HomeTopCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "HomeTopCollectionViewCell")
        topHomeCollection.showsHorizontalScrollIndicator = false
        topHomeCollection.dataSource = self
        topHomeCollection.delegate = self
        
        verificationCollection.register(UINib(nibName: "VerificationCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "VerificationCollectionViewCell")
        verificationCollection.showsHorizontalScrollIndicator = false
        verificationCollection.delegate = self
        verificationCollection.dataSource = self
        
        recommendationViews.register(UINib(nibName: "RecommendationCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "RecommendationCollectionViewCell")
        recommendationViews.showsHorizontalScrollIndicator = false
        recommendationViews.delegate = self
        recommendationViews.dataSource = self
        
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x / width)
        pageControl.currentPage = currentPage
    }

}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView.tag == 1 {
            return homeCellData.count
        }
        else if collectionView.tag == 2{
             return 3
        }
        else if collectionView.tag == 3{
            return 3
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView.tag == 1{
            let topCell = topHomeCollection.dequeueReusableCell(withReuseIdentifier: "HomeTopCollectionViewCell", for: indexPath) as! HomeTopCollectionViewCell
            topCell.setUpData(with: homeCellData[indexPath.item])
            return topCell
        }
        else if collectionView.tag == 2{
            let verificationCell = verificationCollection.dequeueReusableCell(withReuseIdentifier: "VerificationCollectionViewCell", for: indexPath) as! VerificationCollectionViewCell
            return verificationCell
        }
        else if collectionView.tag == 3{
            let recommendationCell = recommendationViews.dequeueReusableCell(withReuseIdentifier: "RecommendationCollectionViewCell", for: indexPath) as! RecommendationCollectionViewCell
            return recommendationCell
        }
       
        return UICollectionViewCell()
    }
}
    
    extension HomeViewController: UICollectionViewDelegateFlowLayout{
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            if collectionView.tag == 1{
                let widthOfScreen = collectionView.bounds.width
                let heightOfScreen = collectionView.bounds.height
                return CGSize(width: widthOfScreen, height: heightOfScreen)
            }
            else if collectionView.tag == 2{
                let widthOfTheScreen = collectionView.bounds.width
                return CGSize(width: (widthOfTheScreen)/2, height: 270)
            }
            else if collectionView.tag == 3{
                
                let widthOfScreen: CGFloat = 250
                let heightOfScreen = collectionView.bounds.height
                return CGSize(width: widthOfScreen, height: heightOfScreen)

            }
            return CGSize(width: 50, height: 50)  // Adjust the default size as per your requirement
        }
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
            if collectionView.tag == 1{
                return 0
                
            }
            else if collectionView.tag == 2{
                return 0
            }
            else if collectionView.tag == 3{
                return 10
            }
            return 0
        }
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
            if collectionView.tag == 1{
                return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            }
//            else if collectionView.tag == 2{
//                return UIEdgeInsets(top: -10, left: 0, bottom: 0, right: 0)
//            }
            return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0
            )
        }
        
       
    }




