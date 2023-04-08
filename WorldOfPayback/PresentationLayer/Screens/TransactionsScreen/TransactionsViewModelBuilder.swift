//
//  TransactionsViewModelBuilder.swift
//  WorldOfPayback
//
//  Created by swamnx on 8.04.23.
//

import SwiftUI

@MainActor
struct TransactionsViewModelBuilder {

    static func build() -> TransactionsViewModel {
        let transactionsViewModel = TransactionsViewModel(
            apiService: AppContext.shared.apiService
        )
        return transactionsViewModel
    }

    static func buildMock() -> TransactionsViewModel {
        let transactionsViewModel = TransactionsViewModel(
            apiService: AppContext.sharedMock.apiService
        )
        return transactionsViewModel

    }
}
