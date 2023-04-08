//
//  TransactionsViewModelBuilder.swift
//  WorldOfPayback
//
//  Created by swamnx on 8.04.23.
//

import SwiftUI

struct TransactionsViewModelBuilder {

    @EnvironmentObject private var appContext: AppContext

    func build() -> TransactionsViewModel {
        let transactionsViewModel = TransactionsViewModel(
            apiService: appContext.apiService
        )
        return transactionsViewModel
    }

    func buildMock() -> TransactionsViewModel {
        let transactionsViewModel = TransactionsViewModel(
            apiService: MockApiService()
        )
        return transactionsViewModel

    }
}
