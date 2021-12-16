//
//  ExchangeDetailViewModel.swift
//  YahooFinance
//
//  Created by Sheikh Ali on 13/12/2021.
//

import Foundation

final class ExchangeDetailViewModel {
    var coordinator: ExchangeDetailCoordinator?
    
    func viewDidDisappear(){
        coordinator?.didFinishExchangeDetail()
    }
}
