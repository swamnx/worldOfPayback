//
//  TransactionFilterModel.swift
//  WorldOfPayback
//
//  Created by swamnx on 11.04.23.
//

import Foundation

struct TransactionFilter {

    var selectedCategories: Set<TransactionFilterCategory> = .init()

    func isContainCategory(category: Int) -> Bool {
        selectedCategories.contains { $0.getIntValue() == category }
    }

}
