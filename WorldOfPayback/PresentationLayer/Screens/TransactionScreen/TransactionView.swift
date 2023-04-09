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
        static let mainShadowColor = UIAppConstants.AppColors.defaultShadow
        static let defaultYellow = UIAppConstants.AppColors.defaultYellow
        static let defaultCyan = UIAppConstants.AppColors.defaultCyan
        static let titlePadding: CGFloat = 50
        static let elementPadding: CGFloat = 30
        static let shadowRadius: CGFloat = 10
        static let gradientColorPart1 = UIAppConstants.AppColors.gradientTansactionPart1
        static let gradientColorPart2 = UIAppConstants.AppColors.gradientTansactionPart2
        static let titleText = String(localized: "Transaction details")
        static let partnerText = String(localized: "Partner Name:")
        static let descriptionText = String(localized: "Description:")
    }

    @StateObject var viewModel: TransactionViewModel

    var body: some View {
        GeometryReader { reader in
            VStack {
                Text(Constants.titleText)
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(Constants.mainColor)
                    .frame(
                        maxWidth: reader.size.width,
                        maxHeight: reader.size.height / 4
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
                        RoundedRectangle(cornerRadius: reader.size.height / 16)
                    )
                    .padding(.top, Constants.titlePadding)
                    .padding([.leading, .trailing], Constants.elementPadding)
                    .shadow(color: Constants.mainShadowColor, radius: Constants.shadowRadius)

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

            }
        }
        .background(Constants.mainBackgroundColor)
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
