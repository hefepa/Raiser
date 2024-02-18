//
//  CategoryCollectionViewCell.swift
//  InvestmentApp
//
//  Created by WEMA on 09/02/2024.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var catImage: UIImageView!
    @IBOutlet weak var catName: UILabel!
    @IBOutlet weak var viewContainer: UIView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        
        contentView.layer.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1).cgColor
        viewContainer.backgroundColor =  UIColor(red: 0.97, green: 0.97, blue: 0.97, alpha: 1)
        viewContainer.clipsToBounds = false
        addBezierShadow(to: viewContainer)
        catName.font = .systemFont(ofSize: 12, weight: .bold)
        catName.textColor = UIColor(red: 0.663, green: 0.031, blue: 0.212, alpha: 1)


    }
    
    func addBezierShadow(to view: UIView) {
            // Create a Bezier path for the shadow shape
            let bezierPath = UIBezierPath()
            bezierPath.move(to: CGPoint(x: 10, y: view.bounds.height - 10))
            bezierPath.addLine(to: CGPoint(x: view.bounds.width - 10, y: view.bounds.height - 10))
            bezierPath.addLine(to: CGPoint(x: view.bounds.width - 10, y: view.bounds.height / 2))
            bezierPath.addQuadCurve(to: CGPoint(x: 10, y: view.bounds.height / 2), controlPoint: CGPoint(x: view.bounds.width / 2, y: view.bounds.height))
            bezierPath.close()

            // Apply the Bezier path to the shadow
            view.layer.shadowPath = bezierPath.cgPath

            // Set other shadow properties
            view.layer.shadowColor = UIColor.black.cgColor
            view.layer.shadowOpacity = 0
            view.layer.shadowOffset = CGSize(width: 0, height: 5)
            view.layer.shadowRadius = 20
        }
    
    func setupData(with data: CategoriesProperties){
        if let imageReceived = catImage{
            imageReceived.image = UIImage(named: data.catImage ?? "empty")
        }
        self.catName.text = data.catName
    }

}
