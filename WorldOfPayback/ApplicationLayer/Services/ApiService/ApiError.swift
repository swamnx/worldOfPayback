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
    case mockError
}

extension ApiError: LocalizedError {

    public var errorDescription: String? {
        switch self {
        case .unknownError:
            return String(localized: "Key: Api Error Unknown")
        case .parsingDTOError:
            return String(localized: "Key: Api Error Parsing DTO")
        case .mockError:
            return String(localized: "Key: Api Mock Error")
        }
    }
}
