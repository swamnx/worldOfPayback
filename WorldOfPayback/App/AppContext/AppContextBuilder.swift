//
//  AppContextBuilder.swift
//  WorldOfPayback
//
//  Created by swamnx on 7.04.23.
//

import Foundation

extension AppContext {

    static func build() -> AppContext {
        let apiService = MockApiService()

        let appContext = AppContext(
            apiService: apiService
        )
        return appContext
    }
}
