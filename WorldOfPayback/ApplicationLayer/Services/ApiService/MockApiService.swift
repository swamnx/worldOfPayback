//
//  MockApiService.swift
//  WorldOfPayback
//
//  Created by swamnx on 7.04.23.
//

import Foundation

struct MockApiService: ApiService {

    func fetchAllTransactions() async -> Result<[TransactionModel], Error> {

        guard let path = Bundle.main.path(
            forResource: "apiServiceTransactionsMock",
            ofType: "json"
        ) else {
            return .failure(ApiError.unknownError)
        }

        do {
            let jsonData = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
            let parsedData = try JSONDecoder().decode(TransactionsDTO.self, from: jsonData)
            let mappedData = parsedData.items.map { transactionDTO in
                TransactionModel(
                    id: transactionDTO.alias.reference,
                    partner: transactionDTO.partnerDisplayName,
                    description: transactionDTO.transactionDetail.description,
                    date: DateServiceUtil.apiDateFormatter.date(
                        from: transactionDTO.transactionDetail.bookingDate
                    )!,
                    value: .init(
                        amount: transactionDTO.transactionDetail.value.amount,
                        currency: transactionDTO.transactionDetail.value.currency
                    )
                )
            }
            return .success(mappedData)
        } catch {
            return .failure(ApiError.parsingDTOError)
        }
    }

}
