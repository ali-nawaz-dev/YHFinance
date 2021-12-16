//
//  ExchangeListCoordinator.swift
//  YahooFinance
//
//  Created by Sheikh Ali on 13/12/2021.
//

import Foundation
import UIKit

final class ExchangeListCoordinator: Coordinator {
    
    private(set) var childCoordinators: [Coordinator] = []
    
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewModel = ExchangesListViewModel()
        viewModel.coordinator = self
        let viewController = ExchangeListViewController.instantiate(viewModel: viewModel)
        navigationController.setViewControllers([viewController], animated: true)
    }
    
    func startExchangeDetail() {
        let exchangeDetailCoordinator: ExchangeDetailCoordinator = ExchangeDetailCoordinator(navigationController: navigationController)
        childCoordinators.append(exchangeDetailCoordinator)
        exchangeDetailCoordinator.parentCoordinator = self
        exchangeDetailCoordinator.start()
    }
    
    func childDidFinish(_ childCoordinator: Coordinator) {
        if let index = childCoordinators.firstIndex(where: { coordinator -> Bool in
            return childCoordinator === coordinator
        }) {
            childCoordinators.remove(at: index)
        }
    }
}
