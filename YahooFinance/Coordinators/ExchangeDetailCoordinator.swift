//
//  ExchangeDetailCoordinator.swift
//  YahooFinance
//
//  Created by Sheikh Ali on 13/12/2021.
//

import Foundation
import UIKit

final class ExchangeDetailCoordinator: Coordinator {
    
    private(set) var childCoordinators: [Coordinator] = []
    private let navigationController: UINavigationController
    
    var parentCoordinator: ExchangeListCoordinator?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewModel = ExchangeDetailViewModel()
        viewModel.coordinator = self
        let exchangeDetailViewController = ExchangeDetailViewController.instantiate(viewModel: viewModel)
        navigationController.present(exchangeDetailViewController, animated: true)
    }
    
    func didFinishExchangeDetail() {
        parentCoordinator?.childDidFinish(self)
    }
}
