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
        static let mainAdvancedColor = UIAppConstants.AppColors.defaultAdvanced
        static let titlePadding: CGFloat = 30
        static let elementPadding: CGFloat = 15
        static let defaultErrorButtonText = String(localized: "Close")
        static let iconNoData = UIAppConstants.AppColors.iconNoData
        static let noDataText = String(localized: "No data")
        static let noNetworkText = String(localized: "No network")
    }

    let titleText: String

    @StateObject var viewModel: TransactionsViewModel
    @EnvironmentObject var networkMonitor: NetworkMonitor

    var body: some View {
        Group {
            ZStack {
                ScrollView(.vertical) {
                    VStack {

                        Spacer(minLength: Constants.elementPadding)

                        if viewModel.filteredTransactions.isEmpty && !viewModel.isLoading {
                            noDataView()
                        }

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
                .refreshable {
                    if networkMonitor.isConnected {
                        Task {
                            await viewModel.loadData()
                        }
                    }
                }

                if viewModel.isLoading {
                    loaderView()
                }
            }
            .safeAreaInset(edge: .top) {
                VStack(spacing: 0) {
                    TopHeaderView(
                        titleText: titleText,
                        elementPadding: Constants.titlePadding
                    )
                    if !networkMonitor.isConnected {
                        noNetworkView()
                    }
                }
            }
        }
        .background(Constants.mainBackgroundColor)
        .onLoad {
            Task {
                await viewModel.loadData()
            }
        }
        .alert(
            viewModel.errorMessage,
            isPresented: .constant(viewModel.hasErrorMessage)
        ) {
            Button(Constants.defaultErrorButtonText) {
                viewModel.clearErrorMessage()
            }
        }
    }

    func noDataView() -> some View {
        VStack {
            Image(Constants.iconNoData)
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
            Text(Constants.noDataText)
                .font(.title)
                .foregroundColor(Constants.mainColor)
        }
    }

    func loaderView() -> some View {
        ActivityIndicator()
            .background(Constants.mainBackgroundColor)
            .frame(width: 150, height: 150)
            .clipShape(RoundedRectangle(cornerRadius: 30))
    }

    func noNetworkView() -> some View {
        Text(Constants.noNetworkText)
            .font(.title3)
            .foregroundColor(Constants.mainColor)
            .frame(maxWidth: .infinity, maxHeight: 40, alignment: .center)
            .background(Constants.mainAdvancedColor)
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
        .environmentObject(NetworkMonitor())
        
    }
}
