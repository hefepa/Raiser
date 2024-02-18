//
//  PortFolioTableViewCell.swift
//  InvestmentApp
//
//  Created by WEMA on 12/02/2024.
//

import UIKit

var numberOfItemsInPortFolio: [PortFolioProperties] = PortFolioModel().populateData()

class PortFolioTableViewCell: UICollectionViewCell {

    @IBOutlet weak var portFolioTable: UITableView!
    override func awakeFromNib() {
        super.awakeFromNib()
        portFolioTable.separatorStyle = .none
        portFolioTable.register(UINib(nibName: "PortFolioDataTableViewCell", bundle: nil), forCellReuseIdentifier: "PortFolioDataTableViewCell")
        portFolioTable.dataSource = self
        portFolioTable.delegate = self
    }

//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//    }
    
}

extension PortFolioTableViewCell: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        numberOfItemsInPortFolio.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = portFolioTable.dequeueReusableCell(withIdentifier: "PortFolioDataTableViewCell", for: indexPath) as! PortFolioDataTableViewCell
        let portFolioViewCell = numberOfItemsInPortFolio[indexPath.item]
        cell.setupData(with: portFolioViewCell)
        cell.selectionStyle = .none
        return cell
    }
}
