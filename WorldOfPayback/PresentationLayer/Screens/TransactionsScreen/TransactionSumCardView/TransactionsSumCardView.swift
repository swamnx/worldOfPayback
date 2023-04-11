//
//  TransactionsSumView.swift
//  WorldOfPayback
//
//  Created by swamnx on 10.04.23.
//

import SwiftUI

struct TransactionsSumCardView: View {

    private enum Constants {
        
        static let mainAdvancedColor = UIAppConstants.AppColors.defaultAdvanced
        static let gradientColorPart1 = UIAppConstants.AppColors.gradientTansactionListPart1
        static let gradientColorPart2 = UIAppConstants.AppColors.gradientTansactionListPart2

        static let elementPadding: CGFloat = 30
        static let cardPadding: CGFloat = 15

        static let cardHeight: CGFloat = 150

        static let textHeight: CGFloat = 120
        static let titleText = String(localized: "Key: Transactions sum")

    }
    
    let sum: Int

    var body: some View {
        ZStack {
            CardView(
                cardBorderColor: Constants.mainAdvancedColor,
                gradientColorPart1: Constants.gradientColorPart1,
                gradientColorPart2: Constants.gradientColorPart2
            )
            CardViewText(
                text: Constants.titleText + String(sum),
                textBorderColor: Constants.mainAdvancedColor
            )
            .frame(maxWidth: .infinity, maxHeight: Constants.textHeight)
            .padding(Constants.elementPadding)
        }
        .frame(
            maxWidth: .infinity,
            minHeight: Constants.cardHeight,
            maxHeight: Constants.cardHeight
        )
        .padding(Constants.cardPadding)
    }
}

struct TransactionsSumView_Previews: PreviewProvider {
    static var previews: some View {
        TransactionsSumCardView(sum: 3432432)
    }
}
