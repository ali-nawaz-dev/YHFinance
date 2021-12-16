//
//  AppCoordinator.swift
//  YahooFinance
//
//  Created by Sheikh Ali on 12/12/2021.
//

import Foundation
import UIKit

protocol Coordinator: AnyObject{
    var childCoordinators: [Coordinator]  { get }
    func start()
}

final class AppCoordinator: Coordinator {
    
    private(set) var childCoordinators: [Coordinator] = []
    private var window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        let navigationController = UINavigationController.init()
        
        let exchangeListCoordinator = ExchangeListCoordinator(navigationController: navigationController)
        exchangeListCoordinator.start()
        
        childCoordinators.append(exchangeListCoordinator)
        
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}
