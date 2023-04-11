//
//  TransactionsViewModel.swift
//  WorldOfPayback
//
//  Created by swamnx on 8.04.23.
//

import Foundation
import Combine
import SwiftUI

class TransactionsViewModel: ViewModel {

    @Published private var transactions: [TransactionModel] = []
    @Published private var sortedTransactions: [TransactionModel] = []
    @Published private (set) var sortedAndFilteredTransactions: [TransactionModel] = []

    @Published private (set) var isLoading = true
    @Published var isShowingSorting = false
    @Published var isShowingFilter = false

    @Published var sorting: TransactionSortingType
    @Published var filter: TransactionFilter
    @Published var transactionsSum: Int

    private let apiService: ApiService
    private var cancellables = Set<AnyCancellable>()

    init(
        apiService: ApiService
    ) {
        self.apiService = apiService
        self.sorting = .byDateUp
        self.filter = .init()
        self.transactionsSum = 0
        super.init()
        addSubscribers()
    }

    func addSubscribers() {
        $transactions
            .combineLatest($sorting)
            .sink { [weak self] newTransactions, newSorting in
                guard let self else { return }
                let sortingFunction = newSorting.getSortingFunction()
                self.sortedTransactions = newTransactions.sorted(by: sortingFunction)
            }
            .store(in: &cancellables)
        $sortedTransactions
            .combineLatest($filter)
            .sink { [weak self] newSortedTransactions, newFilter in
                guard let self else { return }
                var sortedAndFilteredTransactions = newSortedTransactions
                if !newFilter.selectedCategories.isEmpty {
                    sortedAndFilteredTransactions = sortedAndFilteredTransactions.filter {
                        newFilter.isContainCategory(category: $0.category)
                    }
                }
                self.transactionsSum = sortedAndFilteredTransactions.reduce(into: 0) {
                    $0 += $1.value.amount
                }
                self.sortedAndFilteredTransactions = sortedAndFilteredTransactions
            }
            .store(in: &cancellables)
    }

    func loadData() async {
        self.isLoading = true
        self.transactions.removeAll()
        let response = await self.apiService.fetchAllTransactions()
        self.isLoading = false
        switch response {
        case let .success(data):
            self.transactions = data
        case let.failure(error):
            self.errorMessage = error.localizedDescription
        }
    }

}
