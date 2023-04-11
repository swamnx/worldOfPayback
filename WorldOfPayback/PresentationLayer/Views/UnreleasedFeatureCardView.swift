//
//  UnreleasedFeatureView.swift
//  WorldOfPayback
//
//  Created by swamnx on 7.04.23.
//

import SwiftUI

struct UnreleasedFeatureView: View {

    private enum Constants {
        static let mainColor = UIAppConstants.AppColors.defaultBasic

        static let gradientColorPart1 = UIAppConstants.AppColors.gradientUnreleasedPart1
        static let gradientColorPart2 = UIAppConstants.AppColors.gradientUnreleasedPart2

        static let cardPadding: CGFloat = 15
        static let cardHeight: CGFloat = 300

        static let textPadding: CGFloat = 30
        static let textHeight: CGFloat = 120
        static let text = String(localized: "Key: Unreleased Feature Text")

        static let systemIconName = "exclamationmark.triangle"
        static let iconSize: CGSize = .init(width: 120, height: 120)

    }

    var body: some View {
        ZStack {
            CardView(
                cardBorderColor: Constants.mainColor,
                gradientColorPart1: Constants.gradientColorPart1,
                gradientColorPart2: Constants.gradientColorPart2
            )

            VStack(spacing: 0) {
                Spacer()
                CardViewCircle(
                    ciclreBorderColor: Constants.mainColor,
                    image: Image(systemName: Constants.systemIconName),
                    text: nil
                )
                .frame(
                    maxWidth: Constants.iconSize.width,
                    maxHeight: Constants.iconSize.height
                )

                Spacer()

                CardViewText(
                    text: Constants.text,
                    textBorderColor: Constants.mainColor
                )
                .frame(
                    maxWidth: .infinity,
                    maxHeight: Constants.textHeight
                )
                .padding([.leading, .trailing], Constants.textPadding)

                Spacer()
            }

        }
        .frame(
            maxWidth: .infinity,
            minHeight: Constants.cardHeight,
            maxHeight: Constants.cardHeight
        )
        .padding(Constants.cardPadding)
    }

}

struct UnreleasedFeatureView_Previews: PreviewProvider {

    static var previews: some View {
        UnreleasedFeatureView()
            .previewLayout(.sizeThatFits)
    }
}
