//
//  LearnViewController.swift
//  InvestmentApp
//
//  Created by WEMA on 06/02/2024.
//

import UIKit

class LearnViewController: UIViewController {
    
    var tableData: [LearnProperties] = LearnPropertiesModel().populateData()
    
    @IBOutlet weak var learnTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        //KeyboardUtility.addTapGestureToDismissKeyboard(for: self)
        
        learnTableView.register(UINib(nibName: "LearnTableViewCell", bundle: nil), forCellReuseIdentifier: "LearnTableViewCell")
        
        learnTableView.dataSource = self
        learnTableView.dataSource = self
        
        learnTableView.separatorStyle = .none
        
    }
}

extension LearnViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = learnTableView.dequeueReusableCell(withIdentifier: "LearnTableViewCell", for: indexPath) as! LearnTableViewCell
        cell.setUp(with: tableData[indexPath.item])
        cell.selectionStyle = .none
        return cell
    }
    
    
}
