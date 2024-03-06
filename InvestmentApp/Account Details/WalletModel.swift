//
//  WalletModel.swift
//  InvestmentApp
//
//  Created by WEMA on 27/02/2024.
//

import Foundation

struct WalletModel{
    func populateData() -> [WalletProperties]{
        [
            WalletProperties(walletImage: "Deposit 1", walletName: "Deposit"),
            WalletProperties(walletImage: "withdraw", walletName: "Withdraw"),
            WalletProperties(walletImage: "portfolio", walletName: "Portfolio"),
            WalletProperties(walletImage: "history", walletName: "History")

        ]
    }
}

struct WalletProperties{
    let walletImage: String?
    let walletName: String?
}
