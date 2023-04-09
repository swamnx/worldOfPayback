//
//  TransactionViewModelBuilder.swift
//  WorldOfPayback
//
//  Created by swamnx on 9.04.23.
//

import SwiftUI

@MainActor
struct TransactionViewModelBuilder {

    static func build(model: TransactionModel) -> TransactionViewModel {
        let transactionViewModel = TransactionViewModel(
            titleText: model.partner,
            descriptionText: model.description
        )
        return transactionViewModel
    }

    static func buildMock() -> TransactionViewModel {
        let transactionViewModel = TransactionViewModel(
            titleText: "Some partner text",
            descriptionText: "Some description text"
        )
        return transactionViewModel
    }
}
