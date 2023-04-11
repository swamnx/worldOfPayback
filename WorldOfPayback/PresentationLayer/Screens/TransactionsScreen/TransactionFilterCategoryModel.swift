//
//  TransactionFilterCategoryModel.swift
//  WorldOfPayback
//
//  Created by swamnx on 11.04.23.
//

import Foundation

enum TransactionFilterCategory: String, CaseIterable, Identifiable, Hashable {

    case category1 = "Key: Category 1"
    case category2 = "Key: Category 2"
    case category3 = "Key: Category 3"

    var id: String { self.rawValue }

    func getRawValueWithLocalization() -> String {
        String.init(localized: String.LocalizationValue.init(self.rawValue))
    }

    func getIntValue() -> Int {
        switch self {
        case .category1:
            return 1
        case .category2:
            return 2
        case .category3:
            return 3
        }
    }

}
