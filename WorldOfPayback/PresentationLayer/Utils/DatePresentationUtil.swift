//
//  DatePresentationUtil.swift
//  WorldOfPayback
//
//  Created by swamnx on 8.04.23.
//

import Foundation

struct DatePresentationUtil {

    static let uiDateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        return dateFormatter
    }()

    private init() {

    }
}
