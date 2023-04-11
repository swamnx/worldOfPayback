//
//  DateServiceUtil.swift
//  WorldOfPayback
//
//  Created by swamnx on 8.04.23.
//

import Foundation

struct DateServiceUtil {

    static let apiDateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZZ"
        return dateFormatter
    }()

    private init() {
        
    }
}
