//
//  ApiService.swift
//  WorldOfPayback
//
//  Created by swamnx on 7.04.23.
//

import Foundation

protocol ApiService {

    func fetchAllTransactions() async -> Result<[TransactionModel], Error>
}
