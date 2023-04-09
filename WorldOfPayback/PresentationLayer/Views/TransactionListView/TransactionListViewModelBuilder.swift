//
//  TransactionListViewModelBuilder.swift
//  WorldOfPayback
//
//  Created by swamnx on 8.04.23.
//

import SwiftUI

@MainActor
struct TransactionListViewModelBuilder {

    static func build(model: TransactionModel) -> TransactionListViewModel {
        let transactionListViewModel = TransactionListViewModel(
            id: model.id,
            partnerText: model.partner,
            currencyText: model.value.currency,
            amount: model.value.amount,
            transactionText: model.description,
            date: model.date
        )
        return transactionListViewModel
    }

    static func buildMock() -> TransactionListViewModel {
        let transactionListViewModel = TransactionListViewModel(
            id: "3242",
            partnerText: "Some Partner Group",
            currencyText: "USD",
            amount: 435378,
            transactionText: "Some description about transaction",
            date: .init()
        )
        return transactionListViewModel

    }
}
