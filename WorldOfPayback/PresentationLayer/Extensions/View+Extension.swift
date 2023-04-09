//
//  View+Extension.swift
//  WorldOfPayback
//
//  Created by swamnx on 9.04.23.
//

import SwiftUI

extension View {

    func onLoad(perform action: (() -> Void)? = nil) -> some View {
        modifier(ViewDidLoadModifier(perform: action))
    }

}
