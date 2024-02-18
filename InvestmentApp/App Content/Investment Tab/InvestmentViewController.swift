//
//  InvestmentViewController.swift
//  InvestmentApp
//
//  Created by WEMA on 07/02/2024.
//

import UIKit

var numberOfCategoriesCell: [CategoriesProperties] = CategoriesPropertiesModel().populateData()
var numberOfTandPCell: [TrendingAndPortfolioProperties] = TrendingAndPortfolioModel().populateData()

class InvestmentViewController: UIViewController {
    
    @IBOutlet weak var trendingBtn: UIButton!
    @IBOutlet weak var portfolioBtn: UIButton!
    @IBOutlet weak var catgoryLabel: UILabel!
    @IBOutlet weak var categoryCollection: UICollectionView!
    @IBOutlet weak var trendingAndPortfolioCollection: UICollectionView!
    @IBOutlet weak var trendingStockCollection: UICollectionView!
    @IBOutlet weak var backNav: UIImageView!
    @IBOutlet weak var investNavImage: UIImageView!
    @IBOutlet weak var investNavLabel: UILabel!
    @IBOutlet weak var searchIcon: UIImageView!
    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        
//        let navigationBar = NavigationBar(navigationItem: self.navigationItem)
//        navigationBar.learnNavigation(image: UIImage(named: "investnav"), titleText: "Invest")
//        navigationController?.navigationBar.isTranslucent = true
//
//    }
//    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true

        navigationController?.navigationBar.isTranslucent = true

        categoryCollection.register(UINib(nibName: "CategoryCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CategoryCollectionViewCell")
        categoryCollection.dataSource = self
        categoryCollection.delegate = self
        categoryCollection.tag = 1
        
//        trendingAndPortfolioCollection.register(UINib(nibName: "TrendingAndPortfolioCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "TrendingAndPortfolioCollectionViewCell")
//        trendingAndPortfolioCollection.delegate = self
//        trendingAndPortfolioCollection.dataSource = self
//        trendingAndPortfolioCollection.tag = 2
        
        trendingStockCollection.register(UINib(nibName: "TrendingCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "TrendingCollectionViewCell")
        trendingStockCollection.delegate = self
        trendingStockCollection.dataSource = self
        trendingStockCollection.tag = 3
        
        trendingStockCollection.register(UINib(nibName: "PortFolioTableViewCell", bundle: nil), forCellWithReuseIdentifier: "PortFolioTableViewCell")
        trendingStockCollection.dataSource = self
        trendingStockCollection.delegate = self
        
        trendingStockCollection.isScrollEnabled = false
        
        propertiesAssignment()
        trendingBtn.layer.borderWidth = 2
        trendingBtn.layer.borderColor = UIColor(.green).cgColor
        
        learnNavigation()
        
//        let navigationBar = NavigationBar(navigationItem: self.navigationItem)
//        navigationBar.learnNavigation(image: UIImage(named: "investnav"), titleText: "Invest")
    }
    
    




    private func learnNavigation(){
    //
            let customTitleView = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 44))
    
            let imageView = UIImageView(image: UIImage(named: "investnav"))
            imageView.contentMode = .scaleAspectFit
            imageView.translatesAutoresizingMaskIntoConstraints = false
            customTitleView.addSubview(imageView)
    
            let titleLabel = UILabel()
            titleLabel.text = "Invest"
            titleLabel.font = .systemFont(ofSize: 15, weight: .bold)
            titleLabel.textColor = UIColor.black
            titleLabel.translatesAutoresizingMaskIntoConstraints = false
            customTitleView.addSubview(titleLabel)
    
            // Center the imageView and titleLabel horizontally within customTitleView
            NSLayoutConstraint.activate([
                imageView.centerYAnchor.constraint(equalTo: customTitleView.centerYAnchor),
                imageView.leadingAnchor.constraint(equalTo: customTitleView.leadingAnchor, constant: 100),
    
    
                titleLabel.centerYAnchor.constraint(equalTo: customTitleView.centerYAnchor),
                titleLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 8) // Adjust spacing as needed
            ])
    
            // Ensure that the customTitleView's frame matches its content size
            customTitleView.sizeToFit()
    
            navigationItem.titleView = customTitleView
      }
    
    
    
    
    @IBAction func trendingStocksBtn(_ sender: Any) {
        trendingBtn.layer.borderWidth = 2
        trendingBtn.layer.borderColor = UIColor(.green).cgColor
        portfolioBtn.layer.borderWidth = .nan
        portfolioBtn.layer.borderColor = .none
        let indexPath = IndexPath(item: 0, section: 0)
        trendingStockCollection.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    @IBAction func myPortfolioBtn(_ sender: Any) {
        trendingBtn.layer.borderWidth = .nan
        trendingBtn.layer.borderColor = .none
        portfolioBtn.layer.borderWidth = 2
        portfolioBtn.layer.borderColor = UIColor(.green).cgColor
        let indexPath = IndexPath(item: 1, section: 0)
        trendingStockCollection.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    func propertiesAssignment(){
        catgoryLabel.text = "Categories"
   
        trendingBtn.setTitle("Trending Stocks", for: .normal)
        portfolioBtn.setTitle("My Portfolio", for: .normal)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "search"), style: .plain, target: self, action: nil)
        navigationItem.titleView?.tintColor = .label
    }
}

extension InvestmentViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView.tag == 1{
            
            return numberOfCategoriesCell.count
            
        }else if collectionView.tag == 2{
            
            return numberOfTandPCell.count
            
        }else if collectionView.tag == 3{
            
            return 2
            
        }
        
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView.tag == 1{
            let cellCategory = categoryCollection.dequeueReusableCell(withReuseIdentifier: "CategoryCollectionViewCell", for: indexPath) as! CategoryCollectionViewCell
            let categoryViewCell = numberOfCategoriesCell[indexPath.item]
            cellCategory.setupData(with: categoryViewCell)
            return cellCategory
            //            }else if collectionView.tag == 2{
            //                let cellTAndP = trendingAndPortfolioCollection.dequeueReusableCell(withReuseIdentifier: "TrendingAndPortfolioCollectionViewCell", for: indexPath) as! TrendingAndPortfolioCollectionViewCell
            //                let tAndPViewCell = numberOfTandPCell[indexPath.item]
            //                cellTAndP.updateCell(with: tAndPViewCell)
            //                return cellTAndP
        }else if collectionView.tag == 3 {
            if indexPath.item == 0 {
                let cellTAndPDetails = trendingStockCollection.dequeueReusableCell(withReuseIdentifier: "TrendingCollectionViewCell", for: indexPath) as! TrendingCollectionViewCell
                // Configure cellTAndPDetails if needed
                return cellTAndPDetails
            }else if indexPath.item == 1 {
                let portFolioCell = trendingStockCollection.dequeueReusableCell(withReuseIdentifier: "PortFolioTableViewCell", for: indexPath) as! PortFolioTableViewCell
                // Configure portFolioCell if needed
                return portFolioCell
            }
        }
        return UICollectionViewCell()
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView.tag == 1{
            if indexPath.item == 0{
                let joinGroupInvestment = JoinGroupViewController()
                navigationController?.pushViewController(joinGroupInvestment, animated: true)
            }
        }
    }
    func collectionView(_ collectionView: UICollectionView, shouldScrollToSection section: Int) -> Bool {
        // Return false to disable scrolling by swiping
        if collectionView.tag == 3{
            collectionView.isScrollEnabled = false
            return false
        }
        collectionView.isScrollEnabled = true
        return true
    }
}

extension InvestmentViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView.tag == 1{
            let widthOfScreen: CGFloat = 400 / 2
            let heightOfScreen = collectionView.bounds.height
            return CGSize(width: widthOfScreen, height: heightOfScreen)
//        }else if collectionView.tag == 2{
//            let widthOfScreen: CGFloat = 500 / 3
//            let heightOfScreen = collectionView.bounds.height
//            return CGSize(width: widthOfScreen, height: heightOfScreen)
        }else if collectionView.tag == 3{
            let widthOfScreen = collectionView.bounds.width
            let heightOfScreen = collectionView.bounds.height
            return CGSize(width: widthOfScreen, height: heightOfScreen)
        }
        return CGSize(width: 0, height: 50)
    }
}



    
    

    
    

