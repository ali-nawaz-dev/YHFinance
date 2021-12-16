//
//  Constants.swift
//  YahooFinance
//
//  Created by Sheikh Ali on 12/12/2021.
//

import Foundation

struct Constants {
    struct URLConstants {
        static let apiHost: String = "yh-finance.p.rapidapi.com"
        static let apiKey: String = "d8761690d2msh4e24e38e6c9d311p17ee2fjsnf48be2ee697e"
        
        static let baseUrl: String = "https://yh-finance.p.rapidapi.com/"
        
        struct EndPoints {
            static let marketSummary: String = "market/v2/get-summary"
        }
    }
    
}
