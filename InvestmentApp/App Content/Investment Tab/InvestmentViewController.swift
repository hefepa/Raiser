//
//  InvestmentViewController.swift
//  InvestmentApp
//
//  Created by WEMA on 07/02/2024.
//

import UIKit

var numberOfCategoriesCell: [CategoriesProperties] = CategoriesPropertiesModel().populateData()

class InvestmentViewController: UIViewController {
    @IBOutlet weak var catgoryLabel: UILabel!
    @IBOutlet weak var categoryCollection: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        //KeyboardUtility.addTapGestureToDismissKeyboard(for: self)

        
        categoryCollection.register(UINib(nibName: "CategoryCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CategoryCollectionViewCell")
        categoryCollection.dataSource = self
        categoryCollection.delegate = self
        categoryCollection.tag = 1
    }
}

extension InvestmentViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView.tag == 1{
            return numberOfCategoriesCell.count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView.tag == 1{
            let cellCategory = categoryCollection.dequeueReusableCell(withReuseIdentifier: "CategoryCollectionViewCell", for: indexPath) as! CategoryCollectionViewCell
            let categoryViewCell = numberOfCategoriesCell[indexPath.item]
            cellCategory.setupData(with: categoryViewCell)
            return cellCategory
        }
        return UICollectionViewCell()
    }
}

extension InvestmentViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView.tag == 1{
            let widthOfScreen: CGFloat = 300
            let heightOfScreen = collectionView.bounds.height
            return CGSize(width: widthOfScreen, height: heightOfScreen)
        }
        return CGSize(width: 0, height: 50)
    }
}
    
    

