//
//  TransactionFilterCategoryWithBindingModel.swift
//  WorldOfPayback
//
//  Created by swamnx on 11.04.23.
//

import Foundation

class TransactionFilterCategoryWithBinding: ObservableObject, Identifiable, Hashable, Comparable {

    let category: TransactionFilterCategory
    @Published var isSelected: Bool

    var id: String { self.category.rawValue }

    init(
        category: TransactionFilterCategory,
        isSelected: Bool
    ) {
        self.category = category
        self.isSelected = isSelected
    }

    static func == (lhs: TransactionFilterCategoryWithBinding, rhs: TransactionFilterCategoryWithBinding) -> Bool {
        lhs.category == rhs.category
    }

    static func < (lhs: TransactionFilterCategoryWithBinding, rhs: TransactionFilterCategoryWithBinding) -> Bool {
        lhs.category.rawValue < rhs.category.rawValue
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(category)
    }

}
