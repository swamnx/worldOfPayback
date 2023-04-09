//
//  TransactionViewModel.swift
//  WorldOfPayback
//
//  Created by swamnx on 9.04.23.
//

import Foundation

class TransactionViewModel: ViewModel {

    @Published var titleText: String
    @Published var descriptionText: String?

    init(
        titleText: String,
        descriptionText: String?
    ) {
        self.titleText = titleText
        self.descriptionText = descriptionText
    }
}
