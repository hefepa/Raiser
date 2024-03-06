//
//  StudyViewController.swift
//  InvestmentApp
//
//  Created by WEMA on 02/03/2024.
//

import UIKit

class StudyViewController: UIViewController {
    
    let numberOfItemsInTopPicks: [TopPicksProperties] = TopPicksModel().populateData()
    let numberOfItemsInStartLearning: [StartLearningProperties] = StartLearningModel().populateData()
    
//    @IBOutlet weak var backImage: UIImageView!
    @IBOutlet weak var studyHeading: UILabel!
//    @IBOutlet weak var searchImage: UIImageView!
    @IBOutlet weak var topPicksHeading: UILabel!
    @IBOutlet weak var topPicksCollection: UICollectionView!
    @IBOutlet weak var startLearningHeading: UILabel!
    @IBOutlet weak var startLearningCollection: UICollectionView!
    @IBOutlet weak var container: UIView!
    @IBOutlet weak var backButton: UIButton!


    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        
        propertiesAssignment()
        
//      
        
        topPicksCollection.register(UINib(nibName: "TopPicksCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "TopPicksCollectionViewCell")
        topPicksCollection.dataSource = self
        topPicksCollection.delegate = self
        topPicksCollection.tag = 1
        
        startLearningCollection.register(UINib(nibName: "StartLearningCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "StartLearningCollectionViewCell")
        startLearningCollection.dataSource = self
        startLearningCollection.delegate = self
        startLearningCollection.tag = 2
        
        let backImage = UIImage(named: "backicon")
        let tintedBackImage = backImage?.withRenderingMode(.alwaysOriginal)
        
        let searchImage = UIImage(named: "search")
        let tintedSearchImage = searchImage?.withRenderingMode(.alwaysOriginal)
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: tintedBackImage, style: .done, target: self, action: #selector(backNavigation))
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: tintedSearchImage, style: .plain, target: self, action: nil)
        
//        let backNav = UITapGestureRecognizer(target: self, action: #selector(backNavigation))
//        backImage.isUserInteractionEnabled = true
//        backImage.addGestureRecognizer(backNav)

    }
    
//    @IBAction func backButtonTapped(_ sender: UIButton) {
//        print("Tapped")
//        let dashboard = DashboardViewController()
//        navigationController?.pushViewController(dashboard, animated: true)
////        navigationController?.popViewController(animated: true)
//    }
    
    @objc func backNavigation(){
        print("I want to go back")
        navigationController?.popViewController(animated: true)
    }
    
    func propertiesAssignment(){
//        backImage.image = UIImage(named: "backicon")
        
        studyHeading.text = "Study"
        studyHeading.font = .systemFont(ofSize: 15, weight: .regular)
        studyHeading.textColor = UIColor(red: 0.671, green: 0.149, blue: 0.337, alpha: 1)
        
//        searchImage.image = UIImage(named: "search")
        
        topPicksHeading.text = "Top Picks for you"
        topPicksHeading.font = .systemFont(ofSize: 13, weight: .regular)
        topPicksHeading.textColor = UIColor(red: 0.671, green: 0.149, blue: 0.337, alpha: 1)
        
        startLearningHeading.text = "Start Learning"
        startLearningHeading.font = .systemFont(ofSize: 13, weight: .regular)
        startLearningHeading.textColor = UIColor(red: 0.671, green: 0.149, blue: 0.337, alpha: 1)
    }
}

extension StudyViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView.tag == 1{
            return numberOfItemsInTopPicks.count
        }else if collectionView.tag == 2{
            return numberOfItemsInStartLearning.count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView.tag == 1{
            let cell = topPicksCollection.dequeueReusableCell(withReuseIdentifier: "TopPicksCollectionViewCell", for: indexPath) as! TopPicksCollectionViewCell
            cell.setupData(with: numberOfItemsInTopPicks[indexPath.item])
            return cell
        } else if collectionView.tag == 2{
            let cell = startLearningCollection.dequeueReusableCell(withReuseIdentifier: "StartLearningCollectionViewCell", for: indexPath) as! StartLearningCollectionViewCell
            cell.setupData(with: numberOfItemsInStartLearning[indexPath.item])
            return cell
        }
        return UICollectionViewCell()
    }
}

extension StudyViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if collectionView.tag == 1{
            let widthOfTheScreen: CGFloat = 300
            return CGSize(width: (widthOfTheScreen), height: 200)
        }else if collectionView.tag == 2{
            let widthOfTheScreen = collectionView.bounds.width
            return CGSize(width: (widthOfTheScreen - 10)/2, height: 270)
        }
        
        return CGSize(width: 50, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView.tag == 1{
            return 0
        }
        else if collectionView.tag == 2{
            return 0
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if collectionView.tag == 1{
            return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        }else if collectionView.tag == 2{
            return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        }
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
}


