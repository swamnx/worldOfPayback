//
//  AppContext.swift
//  WorldOfPayback
//
//  Created by swamnx on 7.04.23.
//

import Foundation

final class AppContext {

    static let shared = AppContext(
        apiService: MockApiService()
    )

    static let sharedMock = AppContext(
        apiService: MockApiService()
    )

    let apiService: ApiService

    private init(
        apiService: ApiService
    ) {
        self.apiService = apiService
    }
}
