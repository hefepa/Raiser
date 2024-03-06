//
//  DashboardViewController.swift
//  InvestmentApp
//
//  Created by WEMA on 26/02/2024.
//

import UIKit


class DashboardViewController: UIViewController {
    @IBOutlet weak var investmentCollectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var exploreCollectionView: UICollectionView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var exploreLabel: UILabel!

    
    var numbersOfCellInInvestmentCollectionView: [InvestmentTypesProperties] = InvestmentTypesModel().populateData()
    var numberOfCellInExploreCollectionView: [ExploreProperties] = ExploreModel().populateData()

    var currentPage = 0
    
   
    


    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.layer.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1).cgColor

        userNameLabel.text = "\("Hi")" + " \(UserDefaults.standard.string(forKey: "FirstName") ?? "nil")"
        
        exploreLabel.text = "Explore ->"
        exploreLabel.font = .systemFont(ofSize: 13, weight: .regular)
        exploreLabel.textColor = UIColor(red: 0.671, green: 0.149, blue: 0.337, alpha: 1)

        
        investmentCollectionView.register(UINib(nibName: "InvestmentTypesCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "InvestmentTypesCollectionViewCell")
        investmentCollectionView.dataSource = self
        investmentCollectionView.delegate = self
        investmentCollectionView.tag = 1
        
        exploreCollectionView.register(UINib(nibName: "ExploreCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ExploreCollectionViewCell")
        exploreCollectionView.dataSource = self
        exploreCollectionView.delegate = self
        exploreCollectionView.tag = 2
        
        pageControl.currentPageIndicatorTintColor = UIColor(red: 0.404, green: 0.396, blue: 0.91, alpha: 1)
        pageControl.pageIndicatorTintColor = UIColor.lightGray
        
        
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x / width)
        pageControl.currentPage = currentPage
    }




}

extension DashboardViewController: UICollectionViewDataSource, UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView.tag == 1{
            return numbersOfCellInInvestmentCollectionView.count
        }else if collectionView.tag == 2{
            return numberOfCellInExploreCollectionView.count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView.tag == 1{
            let cell = investmentCollectionView.dequeueReusableCell(withReuseIdentifier: "InvestmentTypesCollectionViewCell", for: indexPath) as! InvestmentTypesCollectionViewCell
            cell.setupData(with: numbersOfCellInInvestmentCollectionView[indexPath.item])
            return cell
        }else if collectionView.tag == 2{
            let cell = exploreCollectionView.dequeueReusableCell(withReuseIdentifier: "ExploreCollectionViewCell", for: indexPath) as! ExploreCollectionViewCell
            cell.setupData(with: numberOfCellInExploreCollectionView[indexPath.item])
            return cell
        }
        return UICollectionViewCell()
    }
}

extension DashboardViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView.tag == 1{
            let collectionViewSize = collectionView.frame.size
            return CGSize(width: collectionViewSize.width, height: collectionViewSize.height)
        }else if collectionView.tag == 2{
            let widthOfTheScreen = collectionView.bounds.width
            return CGSize(width: (widthOfTheScreen - 20) / 3, height: 100)
        }
        return CGSize(width: 50, height: 50)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        2
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView.tag == 2{
            if indexPath.item == 1 || indexPath.item == 2{
                let learnPage = LearnViewController()
//                learnPage.hidesBottomBarWhenPushed = true
                navigationController?.pushViewController(learnPage, animated: true)
            }else if indexPath.item == 0{
                let studyPage = StudyViewController()
                studyPage.hidesBottomBarWhenPushed = true
                navigationController?.pushViewController(studyPage, animated: true)
            }else if indexPath.item == 6{
                let glossaryPage = GlossaryViewController()
                glossaryPage.hidesBottomBarWhenPushed = true
                navigationController?.pushViewController(glossaryPage, animated: true)
            }else if indexPath.item == 8{
                let communityPage = CommunityViewController()
                navigationController?.pushViewController(communityPage, animated: true)
            }else if indexPath.item == 3{
                let portfolioPage = HomeViewController()
//                portfolioPage.hidesBottomBarWhenPushed = true
                navigationController?.pushViewController(portfolioPage, animated: true)
            }
        }
    }
}
