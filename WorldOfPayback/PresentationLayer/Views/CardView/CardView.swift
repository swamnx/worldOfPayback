//
//  CardView.swift
//  WorldOfPayback
//
//  Created by swamnx on 11.04.23.
//

import SwiftUI

struct CardView: View {

    private enum Constants {

        static let mainShadowColor = UIAppConstants.AppColors.defaultShadow
        static let cardShadowRadius: CGFloat = 5
        static let cardBorderWidth: CGFloat = 10
    }

    let cardBorderColor: Color
    let gradientColorPart1: Color
    let gradientColorPart2: Color

    var body: some View {
        GeometryReader { reader in
            RoundedRectangle(
                cornerRadius: reader.size.height / 8
            )
            .stroke(
                cardBorderColor,
                lineWidth: Constants.cardBorderWidth
            )
            .background(
                LinearGradient(
                    gradient:
                        Gradient(
                            colors: [
                                gradientColorPart1,
                                gradientColorPart2
                            ]
                        ),
                    startPoint: .topLeading,
                    endPoint: .bottom
                )
            )
            .clipShape(
                RoundedRectangle(
                    cornerRadius: reader.size.height / 8
                )
            )
            .shadow(
                color: Constants.mainShadowColor,
                radius: Constants.cardShadowRadius
            )
        }
    }
}

struct CardView_Previews: PreviewProvider {

    static var previews: some View {
        CardView(
            cardBorderColor: .cyan,
            gradientColorPart1: .purple,
            gradientColorPart2: .blue
        )
        .frame(maxWidth: .infinity, maxHeight: 250)
        .padding(15)
        .previewLayout(.sizeThatFits)
    }
}
