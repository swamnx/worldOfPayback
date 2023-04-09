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

    private let apiService: ApiService

    init(
        apiService: ApiService
    ) {
        self.apiService = apiService
    }

    func loadData() async {
        let response = await self.apiService.fetchAllTransactions()
        switch response {
        case let .success(data):
            self.filteredTransactions = data
        case let.failure(error):
            print("some error")
        }
    }

}
