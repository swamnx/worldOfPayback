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
        static let mainBackgroundColor = UIAppConstants.AppColors.defaultBackground
        static let mainShadowColor = UIAppConstants.AppColors.defaultShadow
        static let gradientColorPart1 = UIAppConstants.AppColors.gradientUnreleasedPart1
        static let gradientColorPart2 = UIAppConstants.AppColors.gradientUnreleasedPart2

        static let elementPadding: CGFloat = 25

        static let cardShadowRadius: CGFloat = 5
        static let cardBorderWidth: CGFloat = 10
        static let cardRoundRadius: CGFloat = 30
        static let cardPadding: CGFloat = 15
        static let cardSize: CGSize = .init(width: 430, height: 300)

        static let textRoundRadius: CGFloat = 30
        static let textHeight: CGFloat = 90
        static let text = String(localized: "UnreleasedFeatureText")

        static let systemIconName = "exclamationmark.triangle"
        static let iconSize: CGSize = .init(width: 150, height: 150)

    }

    var body: some View {
        ZStack {
            cardView()
            VStack {
                Spacer()
                iconView()
                Spacer()
                textView()
                Spacer()
            }

        }
        .frame(
            maxWidth: Constants.cardSize.width,
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
            Constants.mainColor,
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

    func iconView() -> some View {
        Image(systemName: Constants.systemIconName)
            .resizable()
            .scaledToFit()
            .foregroundColor(Constants.mainColor)
            .padding(Constants.elementPadding)
            .background(Constants.mainBackgroundColor)
            .clipShape(Circle())
            .frame(
                width: Constants.iconSize.width,
                height: Constants.iconSize.height
            )

    }

    func textView() -> some View {
        Text(Constants.text)
            .font(.subheadline)
            .foregroundColor(Constants.mainColor)
            .padding(Constants.elementPadding)
            .background(Constants.mainBackgroundColor)
            .clipShape(
                RoundedRectangle(
                    cornerRadius: Constants.textRoundRadius,
                    style: .continuous
                )
            )
            .frame(
                maxHeight: Constants.textHeight
            )
    }
}

struct UnreleasedFeatureView_Previews: PreviewProvider {

    static var previews: some View {
        UnreleasedFeatureView()
            .previewLayout(.sizeThatFits)
    }
}
