//
//  TransactionListViewModelBuilder.swift
//  WorldOfPayback
//
//  Created by swamnx on 8.04.23.
//

import SwiftUI

@MainActor
struct TransactionCardViewModelBuilder {

    static func build(model: TransactionModel) -> TransactionCardViewModel {
        let transactionCardViewModel = TransactionCardViewModel(
            id: model.id,
            partnerText: model.partner,
            currencyText: model.value.currency,
            amount: model.value.amount,
            transactionText: model.description,
            date: model.date
        )
        return transactionCardViewModel
    }

    static func buildMock() -> TransactionCardViewModel {
        let transactionCardViewModel = TransactionCardViewModel(
            id: "3242",
            partnerText: "Some Partner Group",
            currencyText: "USD",
            amount: 435378,
            transactionText: "Some description about transaction",
            date: .init()
        )
        return transactionCardViewModel

    }
}
