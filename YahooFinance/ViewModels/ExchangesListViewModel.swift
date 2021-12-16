//
//  ExchangesListViewModel.swift
//  YahooFinance
//
//  Created by Sheikh Ali on 13/12/2021.
//

import Foundation
import RxSwift

final class ExchangesListViewModel {
    let title = "Exchanges"
    var coordinator: ExchangeListCoordinator?
    
    private let exchangeService: ExchangeServiceProtocol
    
    init(exchangeService: ExchangeServiceProtocol = ExchangeService()) {
        self.exchangeService = exchangeService
    }
    
    func fecthExchangeViewModels() -> Observable<[ExchangeListTableViewCellViewModel]> {
        exchangeService.fetchExchanges().map {
            $0.map { ExchangeListTableViewCellViewModel(exchange: $0)
            }
        }
    }
    
    func showExchangeDetail() {
        coordinator?.startExchangeDetail()
    }
}
