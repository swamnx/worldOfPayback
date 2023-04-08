//
//  TransactionsView.swift
//  WorldOfPayback
//
//  Created by swamnx on 8.04.23.
//

import SwiftUI

struct TransactionsView: View {

    private enum Constants {
        static let mainColor = UIAppConstants.AppColors.defaultBasic
        static let mainBackgroundColor = UIAppConstants.AppColors.defaultBackground
        static let elementPadding: CGFloat = 30
    }

    let titleText: String

    @StateObject var viewModel: TransactionsViewModel

    var body: some View {
        ScrollView(.vertical) {
        }
        .background(Constants.mainBackgroundColor)
        .safeAreaInset(edge: .top) {
            TopHeaderView(
                titleText: titleText,
                elementPadding: Constants.elementPadding
            )
        }
        .onAppear {
            Task {
                await viewModel.loadData()
            }
        }
    }
}

struct TransactionsView_Previews: PreviewProvider {

    private enum Constants {

        static let transactionsHeaderText = String(localized: "TransactionsHeadText")
    }

    static var previews: some View {
        TransactionsView(
            titleText: Constants.transactionsHeaderText,
            viewModel: TransactionsViewModelBuilder.buildMock()
        )
    }
}
