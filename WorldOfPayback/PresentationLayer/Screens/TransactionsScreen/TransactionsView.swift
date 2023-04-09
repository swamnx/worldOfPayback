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
        static let titlePadding: CGFloat = 30
        static let elementPadding: CGFloat = 15
    }

    let titleText: String

    @StateObject var viewModel: TransactionsViewModel

    var body: some View {
            Group {
                ScrollView(.vertical) {
                    VStack {
                        Spacer(minLength: Constants.elementPadding)
                        ForEach(viewModel.filteredTransactions) { transation in

                            NavigationLink(
                                destination: TransactionView(
                                    viewModel: TransactionViewModelBuilder.build(model: transation)
                                )
                            ) {
                                TransactionListView(
                                    viewModel: TransactionListViewModelBuilder.build(model: transation)
                                )
                            }
                        }
                        Spacer(minLength: Constants.elementPadding)
                    }
                }
                .safeAreaInset(edge: .top) {
                    TopHeaderView(
                        titleText: titleText,
                        elementPadding: Constants.titlePadding
                    )
                }
            }
            .background(Constants.mainBackgroundColor)
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
