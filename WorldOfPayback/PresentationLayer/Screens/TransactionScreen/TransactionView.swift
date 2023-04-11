//
//  TransactionView.swift
//  WorldOfPayback
//
//  Created by swamnx on 9.04.23.
//

import SwiftUI

struct TransactionView: View {

    private enum Constants {
        
        static let mainColor = UIAppConstants.AppColors.defaultBasic
        static let mainBackgroundColor = UIAppConstants.AppColors.defaultBackground
        static let defaultYellow = UIAppConstants.AppColors.defaultYellow
        static let defaultCyan = UIAppConstants.AppColors.defaultCyan

        static let elementPadding: CGFloat = 30
        static let cardPadding: CGFloat = 15

        static let cardHeight: CGFloat = 200

        static let gradientColorPart1 = UIAppConstants.AppColors.gradientTansactionPart1
        static let gradientColorPart2 = UIAppConstants.AppColors.gradientTansactionPart2

        static let textHeight: CGFloat = 120

        static let titleText = String(localized: "Key: Transaction details")
        static let partnerText = String(localized: "Key: Partner Name")
        static let descriptionText = String(localized: "Key: Description")
    }

    @StateObject var viewModel: TransactionViewModel

    var body: some View {
        VStack(spacing: 0) {

            headerView()

            detailView(
                category: Constants.partnerText,
                text: viewModel.titleText,
                color: Constants.defaultYellow
            )

            if let descriptionText = viewModel.descriptionText {
                detailView(
                    category: Constants.descriptionText,
                    text: descriptionText,
                    color: Constants.defaultCyan
                )
            }

            Spacer()

        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Constants.mainBackgroundColor)
    }

    func headerView() -> some View {
        ZStack {
            CardView(
                cardBorderColor: Constants.mainColor,
                gradientColorPart1: Constants.gradientColorPart1,
                gradientColorPart2: Constants.gradientColorPart2
            )
            CardViewText(
                text: Constants.titleText,
                textBorderColor: Constants.mainColor
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

    func detailView(category: String, text: String, color: Color) -> some View {
        VStack {
            Text(category)
                .font(.title)
                .bold()
                .foregroundColor(color)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(Constants.elementPadding)
            Text(text)
                .font(.title2)
                .bold()
                .foregroundColor(color)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding([.leading, .trailing], Constants.elementPadding)
        }
    }
}

struct TransactionView_Previews: PreviewProvider {

    static var previews: some View {
        TransactionView(
            viewModel: TransactionViewModelBuilder.buildMock()
        )
    }
}
