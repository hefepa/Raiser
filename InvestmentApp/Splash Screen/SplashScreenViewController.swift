//
//  SplashScreenViewController.swift
//  InvestmentApp
//
//  Created by WEMA on 12/02/2024.
//

import UIKit
var splashCollectionData: [SplashSreenProperties] = SplashSreenModel().populateData()
var btn = ButtonColor()

class SplashScreenViewController: UIViewController {
    @IBOutlet weak var raiserLogo: UIImageView!
    @IBOutlet weak var splashScreenCollection: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var getStartedButton: UIButton!
    var currentPage = 0
    var newOrExistingUserVC: NewOrExistingUserViewController?

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        splashScreenCollection.register(UINib(nibName: "SplashSreenCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "SplashSreenCollectionViewCell")
        splashScreenCollection.dataSource = self
        splashScreenCollection.delegate = self
        
        pageControl.numberOfPages = 2
        pageControl.currentPageIndicatorTintColor = UIColor(red: 0.663, green: 0.118, blue: 0.227, alpha: 1)

        pageControl.pageIndicatorTintColor = UIColor(red: 0.209, green: 0.118, blue: 0.227, alpha: 1)
        
        newOrExistingUserVC = NewOrExistingUserViewController()
        newOrExistingUserVC?.delegate = self
        

        
        propertiesAssignment()
    }
    @IBAction func getStarted(_ sender: UIButton) {
        let newOrExistingPage = ExistingOrNewUserViewController()
        UserDefaults.standard.hasViewSplashScreen = true
        navigationController?.pushViewController(newOrExistingPage, animated: true)
//        present(newOrExistingUserVC!, animated: true, completion: nil)
    }

    func propertiesAssignment(){
        raiserLogo.image = UIImage(named: "raiser")
        
        getStartedButton.setTitle("Get Started", for: .normal)
        getStartedButton.tintColor = .white
        getStartedButton.layer.cornerRadius = 4
        getStartedButton.backgroundColor = UIColor(red: 0.671, green: 0.149, blue: 0.337, alpha: 1)

//        btn.colorConfiguration(button: getStartedButton)
        
    }
}



extension SplashScreenViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        splashCollectionData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = splashScreenCollection.dequeueReusableCell(withReuseIdentifier: "SplashSreenCollectionViewCell", for: indexPath) as! SplashSreenCollectionViewCell
        let cellCollection = splashCollectionData[indexPath.item]
        cell.navigationController = navigationController
        cell.setupData(with: cellCollection, index: indexPath.item, navigationController: cell.navigationController)
        return cell
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x / width)
        pageControl.currentPage = currentPage
    }
}

extension SplashScreenViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.width
        let heightOfTheScreen = collectionView.bounds.height
        return CGSize(width: width, height: heightOfTheScreen)
    }
}

extension SplashScreenViewController: NewOrExistingUserDelegate{
    func newUserButtonTapped() {
        let signupPage = SignUpViewController()
        navigationController?.pushViewController(signupPage, animated: true)
    }
    
    func existingUserButtonTapped() {
        let loginPage = NewLoginViewController()
        navigationController?.pushViewController(loginPage, animated: true)
    }
    
    
}
