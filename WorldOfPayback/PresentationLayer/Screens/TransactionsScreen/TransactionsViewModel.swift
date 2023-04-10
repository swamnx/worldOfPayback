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

    @Published private (set) var sortingType: TransactionsSortingType

    private let apiService: ApiService
    private var cancellables = Set<AnyCancellable>()

    init(
        apiService: ApiService
    ) {
        self.apiService = apiService
        self.sortingType = .byDateUp
        super.init()
        addSubscribers()
    }

    func addSubscribers() {
        $transactions
            .combineLatest($sortingType)
            .sink { [weak self] newTransactions, newSortingType in
                guard let self else { return }
                self.sortedTransactions = newTransactions
                    .sorted(by: TransactionsSorterFunctions.getSortingFunctionBySortingType(type: newSortingType))
            }
            .store(in: &cancellables)
        $sortedTransactions
            .sink { [weak self] newSortedTransactions in
                guard let self else { return }
                self.sortedAndFilteredTransactions = newSortedTransactions
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

    func updateSortingType(type: TransactionsSortingType) {
        self.sortingType = type
    }

}

typealias TransactionsSorterFunction = (TransactionModel, TransactionModel) -> Bool

enum TransactionsSortingType: String, CaseIterable, Identifiable {

    case byDateUp = "By date ↑"
    case byDateDown = "By date ↓"

    var id: String { return self.rawValue }
}

struct TransactionsSorterFunctions {

    static func getSortingFunctionBySortingType(type: TransactionsSortingType) -> TransactionsSorterFunction {
        switch type {
        case .byDateUp:
            return Self.sortByDateUp(lhs:rhs:)
        case .byDateDown:
            return Self.sortByDateDown(lhs:rhs:)
        }
    }

    private static func sortByDateUp(lhs: TransactionModel, rhs: TransactionModel) -> Bool {
        lhs.date < rhs.date
    }

    private static func sortByDateDown(lhs: TransactionModel, rhs: TransactionModel) -> Bool {
        lhs.date > rhs.date
    }
}
