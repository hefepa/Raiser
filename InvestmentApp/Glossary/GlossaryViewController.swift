//
//  GlossaryViewController.swift
//  InvestmentApp
//
//  Created by WEMA on 02/03/2024.
//

import UIKit

class GlossaryViewController: UIViewController {
    
//    @IBOutlet weak var backImage: UIImageView!    
//    @IBOutlet weak var glossaryHeading: UILabel!
//    @IBOutlet weak var searchImage: UIImageView!
    @IBOutlet weak var textContent: UITextView!
    
    let paragraphStyle = NSMutableParagraphStyle()
//    paragraphStyle.alignment = .justified
    
    let glossaryTitle = UILabel()
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.hidesBackButton = true
////        backImage.image = UIImage(named: "backicon")
//        
//        glossaryHeading.text = "Glossary"
//
//        glossaryTitle.text = "Glosssary"
//        glossaryTitle.font = .systemFont(ofSize: 20, weight: .regular)
//        glossaryTitle.textColor = UIColor(red: 0.671, green: 0.149, blue: 0.337, alpha: 1)
//        glossaryTitle.sizeToFit()

        let titleLabel = createTitleLabel(withTitle: "Glossary")
        navigationItem.titleView = titleLabel


        let backImage = UIImage(named: "backicon")
        let tintedBackImage = backImage?.withRenderingMode(.alwaysOriginal)
        
        let searchImage = UIImage(named: "search")
        let tintedSearchImage = searchImage?.withRenderingMode(.alwaysOriginal)
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: tintedBackImage, style: .done, target: self, action: #selector(backNavigation))
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: tintedSearchImage, style: .plain, target: self, action: nil)

        
        textContent.attributedText = NSMutableAttributedString(string: "A\n\nAsset Allocation: Asset allocation is the strategy of dividing your investment portfolio among different asset classes (like stocks, bonds, and cash) to manage risk and achieve your financial goals.\n\nB\n\nBond: When you buy a bond, you're essentially lending money to a company or government. They promise to pay you back the amount you lent plus interest over time.\n\nBroker: This is a person or firm that executes buy or sell orders on behalf of others in exchange for a fee or commission. Like, a middleman who helps you buy or sell investments.\n\nBudget: A budget is a plan for how you will spend and save your money. It helps you track your income and expenses to ensure you're living within your means and working towards your financial goals.\n\nC\n\nCompound Interest: Compound interest is when the interest you earn on an investment is added to the principal, and then the interest is calculated on the new, larger principal. It's like interest earning interest, which can grow your money faster over time.\n\nCredit Score: A credit score is a numerical representation of a person's creditworthiness, based on their credit history. It's used by lenders to determine the likelihood that a borrower will repay their debts.\n\nD\n\nDiversification: Diversification is the practice of spreading your investments across different asset classes (like stocks, bonds, real estate) and within each asset class (different companies or sectors) to reduce risk.\n\nDividend: Dividends are payments made by a corporation to its shareholders, usually in the form of cash or additional shares, as a reward for owning the company's stock.\n\nE\n\nEmergency Fund: Money set aside for unexpected expenses or emergencies. It's like a safety net for unexpected costs.\n\nExchange-Traded Fund (ETF): Similar to a mutual fund, an ETF is a collection of assets like stocks or bonds, but it trades on an exchange like a stock.\n\nExpense Ratio: The expense ratio is the annual fee charged by mutual funds, ETFs, and other investment vehicles to cover their operating expenses. It's expressed as a percentage of the fund's average net assets.\n\nF\n\nFuture Value (FV): This is the value of a sum of money at a specific point in the future, taking into account a specified interest rate. It calculates how much an investment or savings account will grow over time.\n\nI\n\nIndex Fund: An index fund is a type of mutual fund or exchange-traded fund (ETF) with a portfolio constructed to match or track the components of a market index, such as the S&P 500.\n\nIndividual Retirement Account (IRA): An IRA is a retirement savings account that individuals can contribute to on their own. There are different types of IRAs, including traditional IRAs and Roth IRAs, each with their own tax advantages.\n\nInflation: Inflation is the rate at which the general level of prices for goods and services is rising, eroding purchasing power. It's important to consider when making investment decisions as it can affect the real return on investments.\n\nInterest Rate: An interest rate is the percentage of a loan or deposit that is paid or earned over a certain period of time, typically expressed as an annual percentage rate (APR).\n\nInvestment: This is putting money into assets with the expectation of generating income or profit over time. It's simply, making your money work for you by putting it in things that can grow or earn more money.\n\nL\n\nLiquidity: Liquidity refers to how easily an asset can be converted into cash without affecting its market price. Cash is the most liquid asset, while real estate may be less liquid.\n\nM\n\nMarket Capitalization: Market capitalization, or market cap, is the total value of a company's outstanding shares of stock. It's calculated by multiplying the current stock price by the total number of outstanding shares.\n\nMutual Fund: A mutual fund is a pool of money collected from many investors to invest in stocks, bonds, or other assets. It's managed by professional fund managers.\n\nP\n\nPresent Value (PV): This represents the current value of a future sum of money, discounted at a specific interest rate. It is essentially determining what a future cash flow is worth in today's dollars.\n\nR\n\nReturn: Return is the profit or loss on an investment, usually expressed as a percentage of the original investment amount.\n\nReturn on Investment (ROI): A measure of the profitability of an investment, expressed as a percentage of the initial investment. How much money you make compared to how much you put in.\n\nRisk: Risk refers to the possibility of losing some or all of your investment. Generally, higher potential returns come with higher risk.\n\nS\n\nStock: Owning a stock means you own a small piece of a company. When the company does well, the value of your stock usually goes up. When it doesn't do well, the value can go down.\n\nT\n\nTime (t): The number of periods over which the investment or loan is held.\n\n#\n\n401(k): This is a retirement savings plan sponsored by an employer. Employees can contribute a portion of their pre-tax salary into the plan, and often employers match a percentage of the contributions.\n", attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
        
        textContent.textAlignment = .justified
        textContent.font = .systemFont(ofSize: 15, weight: .regular)
    }
    
    func createTitleLabel(withTitle title: String) -> UILabel {
        let glossaryTitle = UILabel()
        glossaryTitle.text = title
        glossaryTitle.textColor = UIColor(red: 0.671, green: 0.149, blue: 0.337, alpha: 1)
        glossaryTitle.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        glossaryTitle.sizeToFit()

        return glossaryTitle
    }
    
    @objc func backNavigation(){
//        let dashboardPage = DashboardViewController()
        navigationController?.popViewController(animated: true)
    }


}
