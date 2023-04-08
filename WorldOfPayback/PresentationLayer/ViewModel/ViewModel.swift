//
//  ViewModel.swift
//  WorldOfPayback
//
//  Created by swamnx on 8.04.23.
//

import Foundation

@MainActor class ViewModel: ObservableObject {

    @Published var errorMessage: String = ""

    var hasErrorMessage: Bool {
        !errorMessage.isEmpty
    }

    func clearErrorMessage() {
        errorMessage = ""
    }
}
