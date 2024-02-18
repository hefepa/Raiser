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
    @IBOutlet weak var navBackImage: UIImageView!
    @IBOutlet weak var learnNavImage: UIImageView!
    @IBOutlet weak var learnNavLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//                
//        let learnNavigationn = LearnNavigation()
//        navigationItem.titleView = learnNavigationn
        
        learnTableView.register(UINib(nibName: "LearnTableViewCell", bundle: nil), forCellReuseIdentifier: "LearnTableViewCell")
        
        learnTableView.dataSource = self
        learnTableView.dataSource = self
        
        learnTableView.separatorStyle = .none
                
        let navigationBar = NavigationBar(navigationItem: self.navigationItem)
        navigationBar.learnNavigation(image: UIImage(named: "learn"), titleText: "Learn")

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
