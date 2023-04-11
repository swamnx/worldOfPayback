//
//  TransactionFilterViewModel.swift
//  WorldOfPayback
//
//  Created by swamnx on 10.04.23.
//

import Foundation
import SwiftUI

class TransactionFilterViewModel: ViewModel {

    @Published var allCategories: Set<TransactionFilterCategoryWithBinding>

    @Binding private (set) var parentTransactionFilter: TransactionFilter
    @Binding private (set) var isShowing: Bool

    init(
        transactionFilter: Binding<TransactionFilter>,
        isShowing: Binding<Bool>
    ) {
        self._parentTransactionFilter = transactionFilter
        self._isShowing = isShowing
        self.allCategories = Set(TransactionFilterCategory.allCases
            .map { category in
                .init(
                    category: category,
                    isSelected: transactionFilter.selectedCategories.wrappedValue.contains(category)
                )
            }
        )
    }

    func applyFilter() {
        self.parentTransactionFilter.selectedCategories = Set(allCategories
            .filter { $0.isSelected }
            .map { $0.category }
        )
        self.isShowing = false
    }

    func resetFilter() {
        allCategories = Set(
            allCategories.map {
                .init(category: $0.category, isSelected: false)
            }
        )
    }

}
