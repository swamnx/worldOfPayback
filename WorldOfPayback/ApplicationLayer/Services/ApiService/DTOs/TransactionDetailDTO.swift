//
//  TransactionDetailsDTO.swift
//  WorldOfPayback
//
//  Created by swamnx on 8.04.23.
//

import Foundation

struct TransactionDetailDTO: Codable {

    let description: String?
    let bookingDate: String
    let value: TransactionValueDTO

}
