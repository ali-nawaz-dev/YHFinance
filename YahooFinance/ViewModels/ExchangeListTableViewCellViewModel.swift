//
//  ExchangeListTableViewCellViewModel.swift
//  YahooFinance
//
//  Created by Sheikh Ali on 13/12/2021.
//

import Foundation

class ExchangeListTableViewCellViewModel {
    
    private let exchange: ExchangeModel
    
    var exchangeName: String = ""
    var symbol: String = ""
    var regularMarketTime: String = ""
    var region: String = ""
    
    init(exchange: ExchangeModel) {
        self.exchange = exchange
        setupData()
    }
    
    private func setupData(){
        exchangeName = exchange.fullExchangeName
        symbol = exchange.symbol
        regularMarketTime = exchange.regularMarketTime.fmt
        region = exchange.region
    }
}
