//
//  TransactionModel.swift
//  WorldOfPayback
//
//  Created by swamnx on 8.04.23.
//

import Foundation

struct TransactionModel: Identifiable {

    struct TransactionValue {

        let amount: Int
        let currency: String
    }

    let id: String
    let partner: String
    let description: String?
    let date: Date
    let value: TransactionValue

}
