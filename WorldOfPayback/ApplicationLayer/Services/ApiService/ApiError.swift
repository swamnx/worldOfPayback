//
//  ApiError.swift
//  WorldOfPayback
//
//  Created by swamnx on 8.04.23.
//

import Foundation

public enum ApiError: Error {

    case unknownError
    case parsingDTOError
}

extension ApiError: LocalizedError {

    public var errorDescription: String? {
        switch self {
        case .unknownError:
            return String(localized: "Unknown Error")
        case .parsingDTOError:
            return String(localized: "Parsing DTO Error")
        }
    }
}
