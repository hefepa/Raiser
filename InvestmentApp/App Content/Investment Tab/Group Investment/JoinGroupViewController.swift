//
//  JoinGroupViewController.swift
//  InvestmentApp
//
//  Created by WEMA on 14/02/2024.
//

import UIKit


class JoinGroupViewController: UIViewController {
    var numberOfGroupInvestmentCell: [JoinGroupProperties] = JoinGroupModel().populateData()
    var dataaccessor: [JoinGroupProperties]?
    var getData: JoinGroupProperties?
    
    @IBOutlet weak var groupInvestmentTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Group Investment"
        navigationItem.titleView?.tintColor = .red
        
        groupInvestmentTable.register(UINib(nibName: "JoinGroupTableViewCell", bundle: nil), forCellReuseIdentifier: "JoinGroupTableViewCell")
        groupInvestmentTable.dataSource = self
        groupInvestmentTable.delegate = self
        
       
        }

    }



extension JoinGroupViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        numberOfGroupInvestmentCell.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let groupInvestmentCell = groupInvestmentTable.dequeueReusableCell(withIdentifier: "JoinGroupTableViewCell", for: indexPath) as! JoinGroupTableViewCell
        groupInvestmentCell.setupData(with: numberOfGroupInvestmentCell[indexPath.item])
        return groupInvestmentCell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let dataRetrieval = numberOfGroupInvestmentCell[indexPath.item]
        let groupPage = GroupInvestmentViewController()
        let investmentCollectionViewCell = InvestmentCollectionViewCell()
        groupPage.getData = dataRetrieval
        investmentCollectionViewCell.getData = dataRetrieval
        //print (groupPage.getData ?? "Nothing found")
         navigationController?.pushViewController(groupPage, animated: true)

        }
        
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            160
        }
        
        
    }

