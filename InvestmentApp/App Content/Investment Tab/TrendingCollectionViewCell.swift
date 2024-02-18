//
//  TrendingCollectionViewCell.swift
//  InvestmentApp
//
//  Created by WEMA on 12/02/2024.
//

import UIKit
var numberOfItemsInStockCell: [TrendingStockProperties] = TrendingStockModel().populateData()

class TrendingCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var trendingStockTable: UITableView!
    override func awakeFromNib() {
        super.awakeFromNib()
        trendingStockTable.separatorStyle = .none
        trendingStockTable.register(UINib(nibName: "TrendingDataTableViewCell", bundle: nil), forCellReuseIdentifier: "TrendingDataTableViewCell")
        trendingStockTable.delegate = self
        trendingStockTable.dataSource = self
    }
}

extension TrendingCollectionViewCell: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        numberOfItemsInStockCell.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = trendingStockTable.dequeueReusableCell(withIdentifier: "TrendingDataTableViewCell", for: indexPath) as! TrendingDataTableViewCell
        let trendingViewCell = numberOfItemsInStockCell[indexPath.item]
        cell.setupData(with: trendingViewCell)
        cell.selectionStyle = .none
        return cell
    }
    
    
}
