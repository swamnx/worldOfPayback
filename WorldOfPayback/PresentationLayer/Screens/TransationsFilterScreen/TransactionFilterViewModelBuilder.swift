//
//  TransactionFilterViewModelBuilder.swift
//  WorldOfPayback
//
//  Created by swamnx on 10.04.23.
//

import SwiftUI

@MainActor
struct TransactionFilterViewModelBuilder {

    static func build(
        parentTransactionFilter: Binding<TransactionFilter>,
        isShowing: Binding<Bool>
    ) -> TransactionFilterViewModel {
        let transactionFilterViewModel = TransactionFilterViewModel(
            transactionFilter: parentTransactionFilter,
            isShowing: isShowing
        )
        return transactionFilterViewModel
    }

    static func buildMock() -> TransactionFilterViewModel {

        let transactionFilterViewModel = TransactionFilterViewModel(
            transactionFilter: .constant(TransactionFilter()),
            isShowing: .constant(true)
        )
        return transactionFilterViewModel
    }
}
