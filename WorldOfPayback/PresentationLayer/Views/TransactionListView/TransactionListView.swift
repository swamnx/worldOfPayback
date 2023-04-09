//
//  TransactionListView.swift
//  WorldOfPayback
//
//  Created by swamnx on 8.04.23.
//

import SwiftUI

struct TransactionListView: View {

    private enum Constants {
        static let mainColor = UIAppConstants.AppColors.defaultBasic
        static let mainBackgroundColor = UIAppConstants.AppColors.defaultBackground.opacity(0.75)
        static let mainAccentColor = UIAppConstants.AppColors.defaultAccent.opacity(0.75)
        static let mainAdvancedColor = UIAppConstants.AppColors.defaultAdvanced
        static let mainShadowColor = UIAppConstants.AppColors.defaultShadow
        static let gradientColorPart1 = UIAppConstants.AppColors.gradientTansactionListPart1
        static let gradientColorPart2 = UIAppConstants.AppColors.gradientTansactionListPart2

        static let cardShadowRadius: CGFloat = 5
        static let cardBorderWidth: CGFloat = 10
        static let cardRoundRadius: CGFloat = 30
        static let cardPadding: CGFloat = 15
        static let cardSize: CGSize = .init(width: 430, height: 250)

        static let basicLength: CGFloat = 40
        static let basicRound: CGFloat = 20
    }

    @StateObject var viewModel: TransactionListViewModel
    
    var body: some View {
        ZStack {
            cardView()
                VStack {
                    headerView()
                        .padding(
                            [.leading, .trailing, .top],
                            Constants.cardBorderWidth / 2
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

    func headerView() -> some View {
        Text(viewModel.partnerText)
            .font(.title2)
            .bold()
            .foregroundColor(Constants.mainColor)
            .frame(
                maxWidth: Constants.cardSize.width,
                maxHeight: Constants.basicLength
            )
            .background(Constants.mainAdvancedColor)
            .clipShape(
                RoundedCornersShape(
                    corners: [.topRight, .topLeft],
                    radius: Constants.cardRoundRadius / 2
                )
            )
    }

    func leftSubview() -> some View {
        VStack {
            Spacer()

            ZStack {
                Circle()
                    .stroke(
                        Constants.mainAdvancedColor,
                        lineWidth: Constants.cardBorderWidth
                    )
                    .background(Constants.mainBackgroundColor)
                    .clipShape(Circle())
                    .frame(
                        width: Constants.basicLength * 2,
                        height: Constants.basicLength * 2
                    )

                Text(viewModel.currencyText)
                    .font(.title3)
                    .foregroundColor(Constants.mainColor)
                    .frame(
                        width: Constants.basicLength * 2,
                        height: Constants.basicLength
                    )
            }

            Spacer()

            Text(viewModel.amountString)
                .font(.title3)
                .foregroundColor(Constants.mainColor)
                .frame(
                    width: Constants.basicLength * 2,
                    height: Constants.basicLength - Constants.cardBorderWidth / 2
                )
                .background(Constants.mainAccentColor)
                .clipShape(
                    RoundedCornersShape(
                        corners: [.topRight, .topLeft],
                        radius: Constants.basicRound
                    )
                )
                .padding(.bottom, Constants.cardBorderWidth / 2)
        }
    }

    func rightSubview() -> some View {
        VStack {
            Spacer()
            ZStack {
                RoundedRectangle(
                    cornerRadius: Constants.basicRound,
                    style: .continuous
                )
                .stroke(
                    Constants.mainAdvancedColor,
                    lineWidth: Constants.cardBorderWidth
                )
                .background(Constants.mainBackgroundColor)
                .clipShape(
                    RoundedRectangle(
                        cornerRadius: Constants.basicRound,
                        style: .continuous
                    )
                )
                .frame(
                    width: Constants.basicLength * 4.5,
                    height: Constants.basicLength * 3
                )

                Text(viewModel.transactionText ?? "")
                    .font(.title3)
                    .foregroundColor(Constants.mainColor)
                    .frame(
                        width: Constants.basicLength * 4.5 - Constants.cardBorderWidth / 2,
                        height: Constants.basicLength * 3
                    )
            }
            .opacity(viewModel.hasTransactionText ? 1 : 0)

            Spacer()

            Text(viewModel.dateString)
                .font(.title3)
                .foregroundColor(Constants.mainColor)
                .frame(
                    width: Constants.basicLength * 4.5,
                    height: Constants.basicLength - Constants.cardBorderWidth / 2
                )
                .background(Constants.mainAdvancedColor)
                .clipShape(
                    RoundedCornersShape(
                        corners: [.topLeft, .topRight],
                        radius: Constants.basicRound
                    )
                )
                .padding(.bottom, Constants.cardBorderWidth / 2)
        }
    }
}

struct TransactionListView_Previews: PreviewProvider {

    static var previews: some View {
        TransactionListView(
            viewModel: TransactionListViewModelBuilder.buildMock()
        )
        .previewLayout(.sizeThatFits)
    }
}
