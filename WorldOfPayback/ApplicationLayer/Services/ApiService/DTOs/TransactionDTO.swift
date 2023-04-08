//
//  TransactionDTO.swift
//  WorldOfPayback
//
//  Created by swamnx on 8.04.23.
//

import Foundation

struct TransactionDTO: Codable {

    let partnerDisplayName: String
    let alias: TransactionAliasDTO
    let category: Int
    let transactionDetail: TransactionDetailDTO
}
