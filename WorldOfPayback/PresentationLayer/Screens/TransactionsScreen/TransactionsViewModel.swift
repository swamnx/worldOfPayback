//
//  TransactionsViewModel.swift
//  WorldOfPayback
//
//  Created by swamnx on 8.04.23.
//

import Foundation
import SwiftUI

class TransactionsViewModel: ViewModel {

    @Published var filteredTransactions: [TransactionModel] = []
    @Published var isLoading = true

    private let apiService: ApiService

    init(
        apiService: ApiService
    ) {
        self.apiService = apiService
    }

    func loadData() async {
        self.isLoading = true
        self.filteredTransactions.removeAll()
        let response = await self.apiService.fetchAllTransactions()
        self.isLoading = false
        switch response {
        case let .success(data):
            self.filteredTransactions = data
        case let.failure(error):
            self.errorMessage = error.localizedDescription
        }
    }

}
