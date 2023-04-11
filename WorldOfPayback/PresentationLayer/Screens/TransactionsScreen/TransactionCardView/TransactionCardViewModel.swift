//
//  TransactionListViewModel.swift
//  WorldOfPayback
//
//  Created by swamnx on 8.04.23.
//

import Foundation

final class TransactionCardViewModel: ViewModel {

    let id: String
    
    @Published var partnerText: String
    @Published var currencyText: String
    @Published var amount: Int
    @Published var transactionText: String?
    @Published var date: Date

    var amountString: String {
        String(amount)
    }

    var dateString: String {
        DatePresentationUtil.uiDateFormatter.string(from: date)
    }

    var hasTransactionText: Bool {
        transactionText != nil
    }

    init(
        id: String,
        partnerText: String,
        currencyText: String,
        amount: Int,
        transactionText: String? = nil,
        date: Date
    ) {
        self.id = id
        self.partnerText = partnerText
        self.currencyText = currencyText
        self.amount = amount
        self.transactionText = transactionText
        self.date = date
    }

}
