//
//  RaiserViewController.swift
//  InvestmentApp
//
//  Created by WEMA on 25/02/2024.
//

import UIKit

class RaiserViewController: UIViewController {

    @IBOutlet weak var raiserImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.hidesBackButton = true
        raiserImage.image = UIImage(named: "raiser 1")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            let splashScreen = SplashScreenViewController(nibName: "SplashScreenViewController", bundle: nil)
            self.navigationController?.pushViewController(splashScreen, animated: true)
        }
    }


   

}
