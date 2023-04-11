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
        static let elementPadding: CGFloat = 15
        static let iconNoData = UIAppConstants.AppIcons.iconNoData
        static let defaultErrorButtonText = String(localized: "Key: Close")
        static let noDataText = String(localized: "Key: No data")
        static let noNetworkText = String(localized: "Key: No network")
        static let sortingText = String(localized: "Key: Sorting options")
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

                        if viewModel.sortedAndFilteredTransactions.isEmpty &&
                            !viewModel.isLoading {
                            noDataView()
                        }

                        if !viewModel.filter.selectedCategories.isEmpty &&
                            !viewModel.sortedAndFilteredTransactions.isEmpty {
                            TransactionsSumCardView(sum: viewModel.transactionsSum)
                        }

                        ForEach(viewModel.sortedAndFilteredTransactions) { transaction in

                            NavigationLink(
                                destination: TransactionView(
                                    viewModel: TransactionViewModelBuilder.build(model: transaction)
                                )
                            ) {
                                TransactionCardView(
                                    viewModel: TransactionCardViewModelBuilder.build(model: transaction)
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
                    headerView()

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
        .confirmationDialog(
            Constants.sortingText,
            isPresented: $viewModel.isShowingSorting,
            titleVisibility: .visible
        ) {
            ForEach(TransactionSortingType.allCases) { sorting in
                Button(sorting.getRawValueWithLocalization()) {
                    viewModel.sorting = sorting
                }
            }
        }
        .sheet(isPresented: $viewModel.isShowingFilter) {
            TransactionFilterView(
                viewModel:
                    TransactionFilterViewModelBuilder.build(
                        parentTransactionFilter: $viewModel.filter,
                        isShowing: $viewModel.isShowingFilter
                    )
            )
        }
    }

    func headerView() -> some View {
        HStack {
            Text(titleText)
                .font(.largeTitle)
                .foregroundColor(Constants.mainColor)
                .frame(maxWidth: .infinity, alignment: .leading)
            Button {
                viewModel.isShowingSorting = true
            } label: {
                Image(systemName: "arrow.up.arrow.down")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(Constants.mainColor)
                    .frame(width: 30, height: 30)

            }
            .disabled(viewModel.isLoading)
            Spacer(minLength: 15)
            Button {
                viewModel.isShowingFilter = true
            } label: {
                Image(systemName: "list.bullet.circle")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(Constants.mainColor)
                    .frame(width: 30, height: 30)

            }
            .disabled(viewModel.isLoading)

        }
        .padding(30)
        .background(.thinMaterial)
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

    static var previews: some View {

        TransactionsView(
            titleText: "Transactions",
            viewModel: TransactionsViewModelBuilder.buildMock()
        )
        .environmentObject(NetworkMonitor())
        
    }
}
