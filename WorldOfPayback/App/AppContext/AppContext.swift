//
//  AppContext.swift
//  WorldOfPayback
//
//  Created by swamnx on 7.04.23.
//

import Foundation

final class AppContext: ObservableObject {

    let apiService: ApiService

    init(
        apiService: ApiService
    ) {
        self.apiService = apiService
    }
}
