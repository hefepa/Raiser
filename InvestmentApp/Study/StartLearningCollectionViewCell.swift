//
//  StartLearningCollectionViewCell.swift
//  InvestmentApp
//
//  Created by WEMA on 02/03/2024.
//

import UIKit

class StartLearningCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var raiserVideoImage: UIImageView!
    @IBOutlet weak var startLearningTitle: UILabel!
    @IBOutlet weak var subStartingLearning: UILabel!
    @IBOutlet weak var percentageCompleted: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var beginner: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        startLearningTitle.font = .systemFont(ofSize: 12, weight: .regular)
        startLearningTitle.textColor = UIColor(red: 0.671, green: 0.149, blue: 0.337, alpha: 1)

        subStartingLearning.font = .systemFont(ofSize: 10, weight: .light)
        percentageCompleted.font = .systemFont(ofSize: 10, weight: .regular)
        beginner.font = .systemFont(ofSize: 10, weight: .regular)
    }
    
    func setupData(with data: StartLearningProperties){
        raiserVideoImage.image = UIImage(named: data.startLearningImage ?? "Empty")
        startLearningTitle.text = data.startLearningTitle
        subStartingLearning.text = data.subStartLearningTitle
        percentageCompleted.text = data.percentageCompleted
        progressBar.progress = data.progressBar ?? 0.0
        beginner.text = "Beginner"
        
    }

}
