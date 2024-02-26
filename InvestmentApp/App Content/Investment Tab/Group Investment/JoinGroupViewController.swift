//
//  JoinGroupViewController.swift
//  InvestmentApp
//
//  Created by WEMA on 14/02/2024.
//

import UIKit

var joinGroup = JoinGroupViewModel(joinGroupNetworkCall: JoinGroupNetworkCall())

class JoinGroupViewController: UIViewController {
    //    var numberOfGroupInvestmentCell: [JoinGroupProperties] = JoinGroupModel().populateData()
    var numberOfGroupInvestmentCell: [JoinGroupProperties]?
    var numberOfManualGroupInvestmentCell: [JoinGroupManualProperties] = JoinGroupManualModel().populateData()
    var dataaccessor: [JoinGroupProperties]?
    var getData: JoinGroupProperties?
    
    @IBOutlet weak var groupInvestmentTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        joinGroup.delegate = self
        
        title = "Group Investment"
        navigationItem.titleView?.tintColor = .red
        
        groupInvestmentTable.register(UINib(nibName: "JoinGroupTableViewCell", bundle: nil), forCellReuseIdentifier: "JoinGroupTableViewCell")
        groupInvestmentTable.dataSource = self
        groupInvestmentTable.delegate = self
        
        Task{
            await joinGroup.getAvailableGroup()
        }
    }
}



extension JoinGroupViewController: UITableViewDelegate, UITableViewDataSource, JoinGroupModelDelegate{
    func didReceivedResponse(data: JoinGroupResponseModel?) {
        DispatchQueue.main.async { [weak self] in
            if let reversedData = data?.data?.reversed(), !reversedData.isEmpty {
                // Take the first 4 items
                self?.numberOfGroupInvestmentCell = Array(reversedData.prefix(4))
                self?.groupInvestmentTable.reloadData()
            }
        }
    }
    
    func didReceiveError(error: String) {
        print("Error is \(error)")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        numberOfGroupInvestmentCell?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let groupInvestmentCell = groupInvestmentTable.dequeueReusableCell(withIdentifier: "JoinGroupTableViewCell", for: indexPath) as! JoinGroupTableViewCell
//        groupInvestmentCell.setupData(with: numberOfGroupInvestmentCell?[indexPath.row])
        groupInvestmentCell.setupManualData(with: numberOfManualGroupInvestmentCell[indexPath.item])
        if let data = numberOfGroupInvestmentCell?[indexPath.item] {
                groupInvestmentCell.setupData(with: data)
            }
        return groupInvestmentCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let dataRetrieval = numberOfGroupInvestmentCell?[indexPath.item]
        let groupPage = GroupInvestmentViewController()
        let investmentCollectionViewCell = InvestmentCollectionViewCell()
        groupPage.getData = dataRetrieval
//      
         navigationController?.pushViewController(groupPage, animated: true)

        }
        
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            160
        }
        
        
    }

