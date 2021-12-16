//
//  ExchangeService.swift
//  YahooFinance
//
//  Created by Sheikh Ali on 12/12/2021.
//

import Foundation
import RxSwift

protocol ExchangeServiceProtocol {
    func fetchExchanges() -> Observable<[ExchangeModel]>
}

class ExchangeService: ExchangeServiceProtocol {
    
    func fetchExchanges() -> Observable<[ExchangeModel]> {
        
        return Observable.create { observer in

            var request = URLRequest(url: NSURL(string:  Constants.URLConstants.baseUrl + Constants.URLConstants.EndPoints.marketSummary)! as URL,
                                              cachePolicy: .useProtocolCachePolicy,
                                              timeoutInterval: 10.0)
            request.httpMethod = "GET"
            request.allHTTPHeaderFields =  [
                "x-rapidapi-host": Constants.URLConstants.apiHost,
                "x-rapidapi-key": Constants.URLConstants.apiKey
            ]
            
            let dataTask = URLSession.shared.dataTask(with: request as URLRequest,
                                            completionHandler: { (data,
                                                                  response,
                                                                  error) -> Void in
               
                if let error = error {
                    observer.onError(error)
                }else {
                    do {
                        let exchangeResponse = try JSONDecoder().decode(ExchangeResponseModel.self,
                                                                                               from: data ?? Data())
                        observer.onNext(exchangeResponse.marketSummaryAndSparkResponse.result)
                    } catch {
                        observer.onError(error)
                    }
                }
        
                observer.onCompleted()
            })
            
            dataTask.resume()
            
            return Disposables.create {
                dataTask.cancel()
            }
        }
    }
}


