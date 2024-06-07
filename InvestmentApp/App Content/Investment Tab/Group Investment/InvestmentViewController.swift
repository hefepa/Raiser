//
//  InvestmentViewController.swift
//  InvestmentApp
//
//  Created by WEMA on 07/02/2024.
//

import UIKit

var numberOfCategoriesCell: [CategoriesProperties] = CategoriesPropertiesModel().populateData()
var numberOfTandPCell: [TrendingAndPortfolioProperties] = TrendingAndPortfolioModel().populateData()

var verifcationCellData: [VerificationUpdatesProperties] = VerificationUpdatesModel().populateData()




class InvestmentViewController: UIViewController {
    var trendingStockViewModel = TrendingStockViewModel(trendingStocknetworkCall: TrendingStockNetworkCall())
    var portfolioViewModel = PortFolioViewModel(portfolioNetworkCall: PortFolioNetworkCall())
    var numberOfItemsInPortFolio: [PortFolioProperties]?

    
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
    @IBOutlet weak var verificationCollection: UICollectionView!
//    @IBOutlet weak var investNavImage: UIImageView!
//    @IBOutlet weak var investNavLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        NotificationCenter.default.addObserver(self, selector: #selector(notificationTapped), name: Notification.Name("nav"), object: nil)
        
        categoryCollection.register(UINib(nibName: "CategoryCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CategoryCollectionViewCell")
        categoryCollection.dataSource = self
        categoryCollection.delegate = self
        categoryCollection.tag = 1
        
        verificationCollection.register(UINib(nibName: "VerificationCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "VerificationCollectionViewCell")
        verificationCollection.showsHorizontalScrollIndicator = false
        verificationCollection.delegate = self
        verificationCollection.dataSource = self
        verificationCollection.tag = 2
        
        trendingStockCollection.register(UINib(nibName: "TrendingCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "TrendingCollectionViewCell")
        trendingStockCollection.delegate = self
        trendingStockCollection.dataSource = self
        trendingStockCollection.tag = 3
        
        trendingStockCollection.register(UINib(nibName: "PortFolioTableViewCell", bundle: nil), forCellWithReuseIdentifier: "PortFolioTableViewCell")
        trendingStockCollection.dataSource = self
        trendingStockCollection.delegate = self
        
        
        trendingStockCollection.isScrollEnabled = false
        
        propertiesAssignment()
        investNavLabel.text = "Invest"
        trendingBtn.layer.borderWidth = 2
        trendingBtn.layer.borderColor = UIColor(red: 0.663, green: 0.031, blue: 0.212, alpha: 1).cgColor
        trendingBtn.tintColor = UIColor(red: 0.663, green: 0.031, blue: 0.212, alpha: 1)
        portfolioBtn.tintColor = .black
//        learnNavigation()
    }
    
    private func learnNavigation(){

        let customTitleView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 44))
    
            let imageView = UIImageView(image: UIImage(named: "investnav"))
//        imageView.contentMode = .scaleAspectFit
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
//                customTitleView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 80),
//                customTitleView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 80),
                
                imageView.centerYAnchor.constraint(equalTo: customTitleView.centerYAnchor),
                imageView.leadingAnchor.constraint(equalTo: customTitleView.leadingAnchor, constant: 100),
    
    
                titleLabel.centerYAnchor.constraint(equalTo: customTitleView.centerYAnchor, constant: 8),
                titleLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 8) // Adjust spacing as needed
            ])
    
            // Ensure that the customTitleView's frame matches its content size
            customTitleView.sizeToFit()
    
            navigationItem.titleView = customTitleView
      }
    
    
    
    
    @IBAction func trendingStocksBtn(_ sender: Any) {
        trendingBtn.layer.borderWidth = 2
        trendingBtn.layer.borderColor = UIColor(red: 0.663, green: 0.031, blue: 0.212, alpha: 1).cgColor
        trendingBtn.tintColor = UIColor(red: 0.663, green: 0.031, blue: 0.212, alpha: 1)
        portfolioBtn.layer.borderWidth = .nan
        portfolioBtn.layer.borderColor = .none
        portfolioBtn.tintColor = .black
        let indexPath = IndexPath(item: 0, section: 0)
        trendingStockCollection.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    @IBAction func myPortfolioBtn(_ sender: Any) {
        trendingBtn.layer.borderWidth = .nan
        trendingBtn.layer.borderColor = .none
        trendingBtn.tintColor = .black
        portfolioBtn.layer.borderWidth = 2
        portfolioBtn.tintColor = UIColor(red: 0.663, green: 0.031, blue: 0.212, alpha: 1)
        portfolioBtn.layer.borderColor = UIColor(red: 0.663, green: 0.031, blue: 0.212, alpha: 1).cgColor
        let indexPath = IndexPath(item: 1, section: 0)
        trendingStockCollection.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    func propertiesAssignment(){
        catgoryLabel.text = "Categories"
   
        trendingBtn.setTitle("Trending Stocks", for: .normal)
        portfolioBtn.setTitle("My Portfolio", for: .normal)
        
       
    }
}

extension InvestmentViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func didSelectItem(at indexPath: IndexPath) {
        let investmentDetails = GroupInvestmentDetailsViewController()
        self.navigationController?.pushViewController(investmentDetails, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView.tag == 1{
            return numberOfCategoriesCell.count
        }else if collectionView.tag == 2{
            return verifcationCellData.count
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
           
        }else if collectionView.tag == 3 {
            if indexPath.item == 0 {
                let cellTAndPDetails = trendingStockCollection.dequeueReusableCell(withReuseIdentifier: "TrendingCollectionViewCell", for: indexPath) as! TrendingCollectionViewCell
                // Configure cellTAndPDetails if needed
                cellTAndPDetails.initCell(trendingStockViewModel: trendingStockViewModel)
                return cellTAndPDetails
            }else if indexPath.item == 1 {
                
                let portFolioCell = trendingStockCollection.dequeueReusableCell(withReuseIdentifier: "PortFolioTableViewCell", for: indexPath) as! PortFolioTableViewCell
                // Configure portFolioCell if needed
//                PortFolioDataTableViewCell
                portFolioCell.initCell(portfolioViewModel: portfolioViewModel)
                portFolioCell.delegate = self
                
                return portFolioCell
            }
        }else if collectionView.tag == 2 {
            let verificationCell = verificationCollection.dequeueReusableCell(withReuseIdentifier: "VerificationCollectionViewCell", for: indexPath) as! VerificationCollectionViewCell
            verificationCell.setupData(with: verifcationCellData[indexPath.item])
            return verificationCell
        }
        return UICollectionViewCell()
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView.tag == 1{
            if indexPath.item == 0{
                
                let joinGroupInvestment = JoinGroupViewController()
                joinGroupInvestment.hidesBottomBarWhenPushed = true
                self.navigationController?.pushViewController(joinGroupInvestment, animated: true)
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
        }else if collectionView.tag == 3{
            let widthOfScreen = collectionView.bounds.width
            let heightOfScreen = collectionView.bounds.height
            return CGSize(width: widthOfScreen, height: heightOfScreen)
        }else if collectionView.tag == 2{
            let widthOfTheScreen = collectionView.bounds.width
            return CGSize(width: (widthOfTheScreen)/2, height: 240)
        }
        return CGSize(width: 0, height: 50)
    }
}

func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    
    if collectionView.tag == 2{
        return 0
    }
    return 0
}

extension InvestmentViewController: PortFolioTableDelegate{
    func didTapButton(inCell cell: PortFolioDataTableViewCell, data: PortFolioProperties?) {
        print ("View tapped")
        let investmentDetails = GroupInvestmentDetailsViewController()
        print("DATA IS: \(data)")
        investmentDetails.getData = data
        print("they are: \(investmentDetails.getData)")
        investmentDetails.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(investmentDetails, animated: true)
    }
    @objc func notificationTapped() {
        print ("View tapped notification")
        let investmentDetails = GroupInvestmentDetailsViewController()
        navigationController?.pushViewController(investmentDetails, animated: true)
    }
}
