//
//  TransactionsSumView.swift
//  WorldOfPayback
//
//  Created by swamnx on 10.04.23.
//

import SwiftUI

struct TransactionsSumView: View {

    private enum Constants {
        static let mainColor = UIAppConstants.AppColors.defaultBasic
        static let mainBackgroundColor = UIAppConstants.AppColors.defaultBackground.opacity(0.75)
        static let mainAdvancedColor = UIAppConstants.AppColors.defaultAdvanced
        static let mainShadowColor = UIAppConstants.AppColors.defaultShadow
        static let gradientColorPart1 = UIAppConstants.AppColors.gradientTansactionListPart1
        static let gradientColorPart2 = UIAppConstants.AppColors.gradientTansactionListPart2

        static let elementPadding: CGFloat = 30

        static let cardShadowRadius: CGFloat = 5
        static let cardBorderWidth: CGFloat = 10
        static let cardRoundRadius: CGFloat = 30
        static let cardPadding: CGFloat = 15
        static let cardSize: CGSize = .init(width: 430, height: 150)

        static let textHeight: CGFloat = 120
        static let titleText = String(localized: "Transactions sum:")

    }
    
    let sum: Int

    var body: some View {
        ZStack {
            cardView()
            textView()
        }
        .frame(
            maxWidth: Constants.cardSize.width,
            minHeight: Constants.cardSize.height,
            maxHeight: Constants.cardSize.height
        )
        .padding(Constants.cardPadding)
    }

    func cardView() -> some View {
        RoundedRectangle(
            cornerRadius: Constants.cardRoundRadius,
            style: .continuous
        )
        .stroke(
            Constants.mainAdvancedColor,
            lineWidth: Constants.cardBorderWidth
        )
        .background(
            LinearGradient(
                gradient:
                    Gradient(
                        colors: [
                            Constants.gradientColorPart1,
                            Constants.gradientColorPart2
                        ]
                    ),
                startPoint: .topLeading,
                endPoint: .bottom
            )
        )
        .clipShape(
            RoundedRectangle(
                cornerRadius: Constants.cardRoundRadius,
                style: .continuous
            )
        )
        .shadow(
            color: Constants.mainShadowColor,
            radius: Constants.cardShadowRadius
        )
    }

    func textView() -> some View {
        ZStack {
            RoundedRectangle(
                cornerRadius: Constants.cardRoundRadius,
                style: .continuous
            )
            .stroke(
                Constants.mainAdvancedColor,
                lineWidth: Constants.cardBorderWidth
            )
            .background(Constants.mainBackgroundColor)
            .clipShape(
                RoundedRectangle(
                    cornerRadius: Constants.cardRoundRadius,
                    style: .continuous
                )
            )

            VStack {
                Text(Constants.titleText)
                    .font(.title2)
                    .bold()
                    .foregroundColor(Constants.mainColor)
                Text(String(sum))
                    .font(.title3)
                    .foregroundColor(Constants.mainColor)
            }
        }
        .frame(
            maxWidth: .infinity,
            maxHeight: Constants.textHeight,
            alignment: .center
        )
        .padding(Constants.elementPadding)
    }
}

struct TransactionsSumView_Previews: PreviewProvider {
    static var previews: some View {
        TransactionsSumView(sum: 3432432)
    }
}
