//
//  ExchangeModelResponse.swift
//  YahooFinance
//
//  Created by Sheikh Ali on 12/12/2021.
//

import Foundation


class ExchangeResponseModel: Codable {
    let marketSummaryAndSparkResponse: MarketSummaryAndExchangeResponseModel
}

class MarketSummaryAndExchangeResponseModel: Codable {
    let result: [ExchangeModel]
    let error: String?
}

class ExchangeModel: Codable {
    let exchangeTimezoneName: String
    let fullExchangeName: String
    let symbol: String
    let gmtOffSetMilliseconds: Double
    let exchangeDataDelayedBy: Double
    let firstTradeDateMilliseconds: Double
    let language: String
    let regularMarketTime: MarketTime
    let exchangeTimezoneShortName: String
    let quoteType: String
    let marketState: String
    let market: String
    let spark: ExchangeSparkModel
    let priceHint: Int
    let tradeable: Bool
    let sourceInterval: Int
    let exchange: String
    let region: String
    let shortName: String?
    let triggerable: Bool
    let regularMarketPreviousClose: MarketTime
}

class MarketTime: Codable {
    let raw: Double
    let fmt: String
}

class ExchangeSparkModel: Codable {
    let timestamp: [Double]
    let symbol: String
    let previousClose: Double
    let chartPreviousClose: Double
    let end: Double?
    let start: Double?
    let dataGranularity: Int
    let close: [Double?]?
}
