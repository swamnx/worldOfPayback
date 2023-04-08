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
        static let shadowRadius: CGFloat = 10
        static let elementRoundRadius: CGFloat = 30
        static let elementPadding: CGFloat = 25
        static let elementSystemIconName = "exclamationmark.triangle"
        static let elementText = String(localized: "UnreleasedFeatureText")

    }

    var body: some View {
        Group {
            VStack {
                Spacer()

                Image(systemName: Constants.elementSystemIconName)
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(Constants.mainColor)
                    .padding(Constants.elementPadding)
                    .background(Constants.mainBackgroundColor)
                    .clipShape(Circle())
                    .frame(maxWidth: 150, maxHeight: 150)

                Spacer()

                Text(Constants.elementText)
                    .multilineTextAlignment(.center)
                    .font(.subheadline)
                    .foregroundColor(Constants.mainColor)
                    .padding(Constants.elementPadding)
                    .background(Constants.mainBackgroundColor)
                    .clipShape(
                        RoundedRectangle(
                            cornerRadius: Constants.elementRoundRadius,
                            style: .continuous
                        )
                    )
                    .frame(maxHeight: 90)

                Spacer()
            }
        }
        .frame(maxWidth: 430, maxHeight: 300)
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
                cornerRadius: Constants.elementRoundRadius,
                style: .continuous
            )
        )
        .shadow(
            color: Constants.mainShadowColor,
            radius: Constants.shadowRadius
        )
    }
}

struct UnreleasedFeatureView_Previews: PreviewProvider {

    static var previews: some View {
        UnreleasedFeatureView()
            .previewLayout(.sizeThatFits)
    }
}
