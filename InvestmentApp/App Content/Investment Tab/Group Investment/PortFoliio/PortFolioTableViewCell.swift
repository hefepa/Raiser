//
//  PortFolioTableViewCell.swift
//  InvestmentApp
//
//  Created by WEMA on 12/02/2024.
//

import UIKit

//var numberOfItemsInPortFolio: [PortFolioProperties] = PortFolioModel().populateData()
//var myPortfolioViewModel: PortFolioViewModel?




class PortFolioTableViewCell: UICollectionViewCell {
    
    var portfolioViewModel: PortFolioViewModel?

    
    weak var delegate: PortFolioTableDelegate?

    var numberOfItemsInPortFolio: [PortFolioProperties]?
    var getData = PortFolioProperties?.self


    @IBOutlet weak var portFolioTable: UITableView!
    override func awakeFromNib() {
        super.awakeFromNib()
        portFolioTable.separatorStyle = .none
        portFolioTable.register(UINib(nibName: "PortFolioDataTableViewCell", bundle: nil), forCellReuseIdentifier: "PortFolioDataTableViewCell")
        portFolioTable.dataSource = self
        portFolioTable.delegate = self
        
        NotificationCenter.default.addObserver(self, selector: #selector(refreshPortfolio), name: Notification.Name("RefreshPortFolio"), object: nil)
//        myPortfolioViewModel?.delegate = self
//        Task{
//            await myPortfolioViewModel?.getPortFolio()
//        }
        

    }
    @objc func refreshPortfolio(){
        Task{
            await portfolioViewModel?.getPortFolio()
        }
    }
    
   
    
    func initCell(portfolioViewModel: PortFolioViewModel){
        self.portfolioViewModel = portfolioViewModel
        self.portfolioViewModel?.delegate = self
        Task{
            await self.portfolioViewModel?.getPortFolio()
        }
    }
    
}


extension PortFolioTableViewCell: UITableViewDelegate, UITableViewDataSource, PortfolioModelDelegate, PortFolioTableDelegate{
   
    
    func didTapButton(inCell cell: PortFolioDataTableViewCell, data: PortFolioProperties?) {
        delegate?.didTapButton(inCell: cell, data: data)
    }
    
    func didReceivedResponse(data: PortFolioResponseModel?) {
        DispatchQueue.main.async { [weak self] in
            self?.numberOfItemsInPortFolio = data?.data
            self?.portFolioTable.reloadData()
        }
    }
    
    func didReceiveError(error: String) {
        print("ERROR")
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        numberOfItemsInPortFolio?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = portFolioTable.dequeueReusableCell(withIdentifier: "PortFolioDataTableViewCell", for: indexPath) as! PortFolioDataTableViewCell
        guard let portfolioViewCell = numberOfItemsInPortFolio?[indexPath.item] else { return cell }
        cell.setUpData(with: portfolioViewCell)
        cell.getData = portfolioViewCell
        cell.onViewButtonTapped = { [weak self] in
            guard let data = self?.numberOfItemsInPortFolio?[indexPath.item] else { return }
        }
        cell.delegate = self
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let dataRetrieval = numberOfItemsInPortFolio?[indexPath.item]
        let investmentDetails = GroupInvestmentDetailsViewController()
        investmentDetails.getData = dataRetrieval
        let allData = investmentDetails.getData
        
        print("All data is: \(allData)")
        print("I selected")
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        250
    }
}




