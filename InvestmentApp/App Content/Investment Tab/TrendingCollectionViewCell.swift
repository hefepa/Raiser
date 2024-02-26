//
//  TrendingCollectionViewCell.swift
//  InvestmentApp
//
//  Created by WEMA on 12/02/2024.
//

import UIKit
 /*= TrendingStockModel().populateData()*/

class TrendingCollectionViewCell: UICollectionViewCell {
    var trendingStockViewModel:TrendingStockViewModel?

    
    var numberOfItemsInPortFolio: [PortFolioProperties]?
    var numberOfItemsInStockCell: [TrendingStockPropertiesModel]?
    
    @IBOutlet weak var trendingStockTable: UITableView!
    override func awakeFromNib() {
        super.awakeFromNib()
//        trendingStockViewModel?.delegate = self
        trendingStockTable.separatorStyle = .none
        trendingStockTable.register(UINib(nibName: "TrendingDataTableViewCell", bundle: nil), forCellReuseIdentifier: "TrendingDataTableViewCell")
//        trendingStockTable.register(UINib(nibName: "PortFolioDataTableViewCell", bundle: nil), forCellReuseIdentifier: "PortFolioDataTableViewCell")
        trendingStockTable.delegate = self
        trendingStockTable.dataSource = self
        
//        myPortfolio.delegate = self
        
        
//        Task{
//            await trendingStockViewModel?.getTrendingStock()
//        }
    }
    func initCell(trendingStockViewModel: TrendingStockViewModel){
        self.trendingStockViewModel = trendingStockViewModel
        self.trendingStockViewModel?.delegate = self
        Task{
            await trendingStockViewModel.getTrendingStock()
        }
    }
}

extension TrendingCollectionViewCell: UITableViewDelegate, UITableViewDataSource, TrendingStockModelDelegate{
    
    func didReceivedResponse(data: [TrendingStockPropertiesModel]?) {
        DispatchQueue.main.async { [weak self] in
            self?.numberOfItemsInStockCell = data ?? []
            self?.trendingStockTable.reloadData()
        }
    }
    
    func didReceiveError(error: String) {
        print("Error\(error)")
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        if section == 0{
            return numberOfItemsInStockCell?.count ?? 0
//        }else if section == 1{
//            return numberOfItemsInPortFolio?.count ?? 0
//        }else{
//            return 0
//        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //        if indexPath.item == 0{
        let trendingCell = trendingStockTable.dequeueReusableCell(withIdentifier: "TrendingDataTableViewCell", for: indexPath) as! TrendingDataTableViewCell
        guard let trendingViewCell = numberOfItemsInStockCell?[indexPath.item] else { return trendingCell }
        trendingCell.setupData(with: trendingViewCell)
        return trendingCell
        //        }else if indexPath.item == 1{
        //            let cell = trendingStockTable.dequeueReusableCell(withIdentifier: "PortFolioDataTableViewCell", for: indexPath) as! PortFolioDataTableViewCell
        //            guard let portfolioViewCell = numberOfItemsInPortFolio?[indexPath.item] else { return cell }
        //            cell.setUpData(with: portfolioViewCell)
        //            cell.selectionStyle = .none
        //            return cell
        //        }
        //        return UITableViewCell()
        //    }
    }
}

