//
//  ALATEcosystemViewController.swift
//  InvestmentApp
//
//  Created by WEMA on 25/02/2024.
//

import UIKit

class ALATEcosystemViewController: UIViewController {
    
    var numberOfItemsInCollectionModel: [ALATEcosystemCollectionCellProperties] = ALATEcosystemCollectionCellModel().populateData()

    
    @IBOutlet weak var ecosystemStackView: UIStackView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var myCollectionView: UICollectionView!
    @IBOutlet weak var licensedByCBNLabel: UILabel!
    @IBOutlet weak var CBNImage: UIImageView!
    @IBOutlet weak var alatLogo: UIImageView!
    @IBOutlet weak var raiserImage: UIImageView!
    @IBOutlet weak var alatonboardingLogo: UIImageView!
    @IBOutlet weak var alatImage: UIImageView!
    @IBOutlet weak var alatBusinessLogo: UIImageView!
    
    var currentPage = 0
//    var timer: Timer?
    var dataSourceArray: [ALATEcosystemCollectionCellProperties]?



    override func viewDidLoad() {
        super.viewDidLoad()
        
        myCollectionView.register(UINib(nibName: "ALATEcosystemCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ALATEcosystemCollectionViewCell")
        myCollectionView.delegate = self
        myCollectionView.dataSource = self
        
        let raiserGesture = UITapGestureRecognizer(target: self, action: #selector(raiserImageTapped))
        raiserImage.isUserInteractionEnabled = true
        raiserImage.addGestureRecognizer(raiserGesture)
        dataSourceArray = DataLoader.loadData()
        myCollectionView.reloadData()

        
        propertiesAssignment()
//        startTimer()

    }
//    func startTimer() {
//            // Adjust the time interval as needed (e.g., 5 seconds)
//            timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(handleTimer), userInfo: nil, repeats: true)
//        }

        // Function called by the timer
//        @objc func handleTimer() {
//            // Perform the sliding animation
//            let newOffset = CGPoint(x: myCollectionView.contentOffset.x + myCollectionView.frame.width, y: myCollectionView.contentOffset.y)
//            
//            // Animate the change in content offset
//            UIView.animate(withDuration: 0.5, animations: {
//                self.myCollectionView.setContentOffset(newOffset, animated: false)
//            }) { (_) in
//                // Update the UIPageControl after the animation completes
//                let newIndex = Int(newOffset.x / self.myCollectionView.frame.width)
//                self.pageControl.currentPage = newIndex
//            }
//        }
    
    @objc func raiserImageTapped(){
        if UserDefaults.standard.hasViewSplashScreen{
            let existingOrNewPage = ExistingOrNewUserViewController()
            self.navigationController?.pushViewController(existingOrNewPage, animated: true)
        }else{
            let splashScreenPage = SplashScreenViewController()
            self.navigationController?.pushViewController(splashScreenPage, animated: true)
        }
    }
    
    
    func propertiesAssignment(){
        
        pageControl.numberOfPages = 3
        pageControl.currentPageIndicatorTintColor = UIColor(red: 0.663, green: 0.118, blue: 0.227, alpha: 1)
        pageControl.pageIndicatorTintColor = UIColor(red: 0.209, green: 0.118, blue: 0.227, alpha: 1)
        
        alatLogo.image = UIImage(named: "alatlogo")
        licensedByCBNLabel.text = "Licensed by the CBN"
        licensedByCBNLabel.font = .systemFont(ofSize: 15, weight: .medium)
        CBNImage.image = UIImage(named: "cbnlogo")

        
        alatBusinessLogo.image = UIImage(named: "alatbusinesslogo")
        alatImage.image = UIImage(named: "alatlogo")
        alatImage.layer.borderWidth = 1
        alatImage.layer.borderColor = UIColor(red: 0.671, green: 0.149, blue: 0.337, alpha: 1).cgColor

        alatonboardingLogo.image = UIImage(named: "onboardingofficelogo")
        alatonboardingLogo.layer.borderWidth = 1
        alatonboardingLogo.layer.borderColor = UIColor(red: 0.671, green: 0.149, blue: 0.337, alpha: 1).cgColor
        
        raiserImage.image = UIImage(named: "raiserlogo")
        raiserImage.layer.borderWidth = 1
        raiserImage.layer.borderColor = UIColor(red: 0.671, green: 0.149, blue: 0.337, alpha: 1).cgColor

        

    }
}

extension ALATEcosystemViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        numberOfItemsInCollectionModel.count
         
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell =  myCollectionView.dequeueReusableCell(withReuseIdentifier: "ALATEcosystemCollectionViewCell", for: indexPath) as! ALATEcosystemCollectionViewCell
        cell.setupData(with: numberOfItemsInCollectionModel[indexPath.item])
        return cell
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x / width)
        pageControl.currentPage = currentPage
        
        // Check if we are at the last item, and reset to the first item
        if currentPage == numberOfItemsInCollectionModel.count {
            let newOffset = CGPoint(x: 0, y: scrollView.contentOffset.y)
            scrollView.setContentOffset(newOffset, animated: false)
            pageControl.currentPage = 0
        }
        print("currentPage: \(currentPage), contentOffset.x: \(scrollView.contentOffset.x), numberOfItems: \(numberOfItemsInCollectionModel.count)")

    }
    

}

extension ALATEcosystemViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.width
        let heightOfTheScreen = collectionView.bounds.height
        return CGSize(width: width, height: heightOfTheScreen)
    }
    
    
}
