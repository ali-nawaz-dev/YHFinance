//
//  ExchangeDetailViewController.swift
//  YahooFinance
//
//  Created by Sheikh Ali on 13/12/2021.
//

import UIKit

class ExchangeDetailViewController: UIViewController {

    var viewModel: ExchangeDetailViewModel!
    
    static func instantiate(viewModel: ExchangeDetailViewModel) -> ExchangeDetailViewController {
        let storyboard = UIStoryboard.init(name: "Main", bundle: .main)
        let viewController = storyboard.instantiateViewController(withIdentifier: "ExchangeDetailViewController") as! ExchangeDetailViewController
        viewController.viewModel = viewModel
        return viewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        viewModel.viewDidDisappear()
    }
}
