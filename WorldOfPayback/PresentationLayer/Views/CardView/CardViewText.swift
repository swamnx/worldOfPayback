//
//  CardViewText.swift
//  WorldOfPayback
//
//  Created by swamnx on 11.04.23.
//

import SwiftUI

struct CardViewText: View {

    private enum Constants {

        static let mainColor = UIAppConstants.AppColors.defaultBasic
        static let mainBackgroundColor = UIAppConstants.AppColors.defaultBackground.opacity(0.75)
        static let cardBorderWidth: CGFloat = 10
        static let textPadding: CGFloat = 15
    }

    let text: String
    let textBorderColor: Color

    var body: some View {
        GeometryReader { reader in
            ZStack {
                RoundedRectangle(
                    cornerRadius: reader.size.height / 4
                )
                .stroke(
                    textBorderColor,
                    lineWidth: Constants.cardBorderWidth
                )
                .background(Constants.mainBackgroundColor)
                .clipShape(
                    RoundedRectangle(
                        cornerRadius: reader.size.height / 4
                    )
                )

                Text(text)
                    .font(.title3)
                    .foregroundColor(Constants.mainColor)
                    .padding(Constants.textPadding)
            }
        }
    }
}

struct CardViewText_Previews: PreviewProvider {
    
    static var previews: some View {
        CardViewText(text: "Some text", textBorderColor: .cyan)
            .frame(maxWidth: .infinity, maxHeight: 90)
            .padding(15)
    }
}
