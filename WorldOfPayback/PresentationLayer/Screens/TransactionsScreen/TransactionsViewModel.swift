//
//  TransactionsViewModel.swift
//  WorldOfPayback
//
//  Created by swamnx on 8.04.23.
//

import Foundation

final class TransactionsViewModel: ViewModel {

    private let apiService: ApiService

    init(
        apiService: ApiService
    ) {
        self.apiService = apiService
    }

}
