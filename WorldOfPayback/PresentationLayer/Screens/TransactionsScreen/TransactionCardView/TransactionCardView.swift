//
//  TransactionListView.swift
//  WorldOfPayback
//
//  Created by swamnx on 8.04.23.
//

import SwiftUI

struct TransactionCardView: View {

    private enum Constants {
        static let mainColor = UIAppConstants.AppColors.defaultBasic
        static let mainAccentColor = UIAppConstants.AppColors.defaultAccent.opacity(0.75)
        static let mainAdvancedColor = UIAppConstants.AppColors.defaultAdvanced
        static let gradientColorPart1 = UIAppConstants.AppColors.gradientTansactionListPart1
        static let gradientColorPart2 = UIAppConstants.AppColors.gradientTansactionListPart2

        static let cardPadding: CGFloat = 15
        static let cardHeight: CGFloat = 250
        static let elementPaddig: CGFloat = 5
        static let basicLength: CGFloat = 40
        static let footerTextRound: CGFloat = 20
    }

    @StateObject var viewModel: TransactionCardViewModel
    
    var body: some View {
        GeometryReader { reader in
            ZStack {
                CardView(
                    cardBorderColor: Constants.mainAdvancedColor,
                    gradientColorPart1: Constants.gradientColorPart1,
                    gradientColorPart2: Constants.gradientColorPart2
                )
                    VStack {
                        headerView(cornerRadius: reader.size.height / 16)
                            .padding(
                                [.leading, .trailing, .top],
                                Constants.elementPaddig
                            )
                        HStack {
                            Spacer()
                            leftSubview()
                            Spacer()
                            rightSubview()
                            Spacer()
                        }
                    }
            }
        }
        .frame(
            maxWidth: .infinity,
            minHeight: Constants.cardHeight,
            maxHeight: Constants.cardHeight
        )
        .padding(Constants.cardPadding)
    }

    func headerView(cornerRadius: CGFloat) -> some View {
        Text(viewModel.partnerText)
            .font(.title2)
            .bold()
            .foregroundColor(Constants.mainColor)
            .frame(
                maxWidth: .infinity,
                maxHeight: Constants.basicLength
            )
            .background(Constants.mainAdvancedColor)
            .clipShape(
                RoundedCornersShape(
                    corners: [.topRight, .topLeft],
                    radius: cornerRadius
                )
            )
    }

    func leftSubview() -> some View {
        VStack(spacing: 0) {
            Spacer()

            CardViewCircle(
                ciclreBorderColor: Constants.mainAdvancedColor,
                image: nil,
                text: viewModel.currencyText
            )
            .frame(
                width: Constants.basicLength * 2,
                height: Constants.basicLength * 2
            )
            Spacer()

            footerTextView(
                text: viewModel.amountString,
                lengthMultiplier: 2,
                backgroundColor: Constants.mainAccentColor
            )
        }
    }

    func rightSubview() -> some View {
        VStack(spacing: 0) {
            Spacer()

            CardViewText(
                text: viewModel.transactionText ?? "",
                textBorderColor: Constants.mainAdvancedColor
            )
            .frame(
                width: Constants.basicLength * 4.5,
                height: Constants.basicLength * 3.5
            )
            .opacity(viewModel.hasTransactionText ? 1 : 0)

            Spacer()

            footerTextView(
                text: viewModel.dateString,
                lengthMultiplier: 4.5,
                backgroundColor: Constants.mainAdvancedColor
            )
        }
    }

    func footerTextView(text: String, lengthMultiplier: Double, backgroundColor: Color ) -> some View {
        Text(text)
            .font(.title3)
            .foregroundColor(Constants.mainColor)
            .frame(
                width: Constants.basicLength * lengthMultiplier,
                height: Constants.basicLength - Constants.elementPaddig
            )
            .background(backgroundColor)
            .clipShape(
                RoundedCornersShape(
                    corners: [.topLeft, .topRight],
                    radius: Constants.footerTextRound
                )
            )
            .padding(.bottom, Constants.elementPaddig)

    }
}

struct TransactionListView_Previews: PreviewProvider {

    static var previews: some View {
        TransactionCardView(
            viewModel: TransactionCardViewModelBuilder.buildMock()
        )
        .previewLayout(.sizeThatFits)
    }
}
