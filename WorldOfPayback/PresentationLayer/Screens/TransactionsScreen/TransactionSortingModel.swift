//
//  TransactionSortingModel.swift
//  WorldOfPayback
//
//  Created by swamnx on 11.04.23.
//

import Foundation

typealias TransactionSortingFunction = (TransactionModel, TransactionModel) -> Bool

enum TransactionSortingType: String, CaseIterable, Identifiable {

    case byDateUp = "Key: By date ↑"
    case byDateDown = "Key: By date ↓"

    var id: String { return self.rawValue }

    func getRawValueWithLocalization() -> String {
        String.init(localized: String.LocalizationValue.init(self.rawValue))
    }

    func getSortingFunction() -> TransactionSortingFunction {
        let sortingFunction: TransactionSortingFunction = { (lhs, rhs) in
            switch self {
            case .byDateUp:
                return  lhs.date < rhs.date
            case .byDateDown:
                return lhs.date > rhs.date
            }
        }
        return sortingFunction
    }
}
