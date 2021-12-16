//
//  Extensions.swift
//  YahooFinance
//
//  Created by Sheikh Ali on 13/12/2021.
//

import Foundation
import UIKit
import RxCocoa
import RxSwift

extension Reactive where Base: UITableView {
    public func modelAndIndexSelected<T>(_ modelType: T.Type) -> ControlEvent<(T, IndexPath)> {
        ControlEvent(events: Observable.zip(
            self.modelSelected(modelType),
            self.itemSelected
        ))
    }
}
