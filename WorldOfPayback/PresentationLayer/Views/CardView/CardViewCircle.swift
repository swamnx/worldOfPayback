//
//  CardViewCircle.swift
//  WorldOfPayback
//
//  Created by swamnx on 11.04.23.
//

import SwiftUI

struct CardViewCircle: View {

    private enum Constants {
        static let mainColor = UIAppConstants.AppColors.defaultBasic
        static let mainBackgroundColor = UIAppConstants.AppColors.defaultBackground.opacity(0.75)
        static let cardBorderWidth: CGFloat = 10
        static let elementPadding: CGFloat = 15
    }

    let ciclreBorderColor: Color
    let image: Image?
    let text: String?

    var body: some View {
        ZStack {
            Circle()
            .stroke(
                ciclreBorderColor,
                lineWidth: Constants.cardBorderWidth
            )
            .background(Constants.mainBackgroundColor)
            .clipShape(Circle())

            if let text {
                Text(text)
                    .font(.title3)
                    .foregroundColor(Constants.mainColor)
                    .padding(Constants.elementPadding)
                    .multilineTextAlignment(.center)
            }
            if let image {
                image
                    .resizable()
                    .padding(Constants.elementPadding)
                    .scaledToFit()
                    .foregroundColor(Constants.mainColor)
                    .clipShape(Circle())
                    .padding(Constants.elementPadding)
            }
        }
    }
}

struct CardViewCircle_Previews: PreviewProvider {

    static var previews: some View {
        VStack {
            CardViewCircle(
                ciclreBorderColor: .cyan,
                image: nil,
                text: "Some text"
            )
            .frame(maxWidth: 100, maxHeight: 100)
            
            CardViewCircle(
                ciclreBorderColor: .cyan,
                image: Image(systemName: "exclamationmark.triangle"),
                text: nil
            )
            .frame(maxWidth: 100, maxHeight: 100)
        }
    }
}
