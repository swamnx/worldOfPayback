//
//  TransactionFilterView.swift
//  WorldOfPayback
//
//  Created by swamnx on 10.04.23.
//

import SwiftUI

struct TransactionFilterView: View {

    private enum Constants {
        static let mainBackgroundColor = UIAppConstants.AppColors.defaultBackground
        static let mainAdvancedColor = UIAppConstants.AppColors.defaultAdvanced
        static let mainAccentColor = UIAppConstants.AppColors.defaultAccent
        static let mainColor = UIAppConstants.AppColors.defaultBasic
        static let mainShadowColor = UIAppConstants.AppColors.defaultShadow

        static let titleText = String("Filter")
        static let categoryTitleText = String("Category")
        static let elementPadding: CGFloat = 30
    }

    @StateObject var viewModel: TransactionFilterViewModel

    var body: some View {
        VStack {
            headerView()

            subHeaderView(text: "Category:")

            VStack {
                ForEach(viewModel.allCategories.sorted(by: <)) { category in
                    Toggle(
                        category.category.rawValue,
                        isOn: Binding(
                            get: { category.isSelected },
                            set: { newValue in
                                viewModel.allCategories.remove(category)
                                viewModel.allCategories.insert(.init(category: category.category, isSelected: newValue))
                            }
                        )
                    )
                    .foregroundColor(Constants.mainColor)
                }
            }
            .padding(.top, 15)

            Spacer()

            footerView()

        }
        .padding(Constants.elementPadding)
        .background(Constants.mainBackgroundColor)
        .interactiveDismissDisabled()
    }

    func controlButtonView(text: String, action: @escaping () -> Void) -> some View {
        Button(text) {
           action()
        }
        .frame(width: 150, height: 50)
        .background(Constants.mainAccentColor)
        .foregroundColor(Constants.mainColor)
        .clipShape(RoundedRectangle(cornerRadius: 15))
        .shadow(color: Constants.mainShadowColor, radius: 5)
    }

    func headerView() -> some View {
        Text(Constants.titleText)
            .font(.largeTitle)
            .bold()
            .foregroundColor(Constants.mainColor)
            .frame(maxWidth: .infinity, alignment: .leading)
    }

    func subHeaderView(text: String) -> some View {
        Text(text)
            .font(.title2)
            .bold()
            .foregroundColor(Constants.mainColor)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.top, 15)
    }

    func footerView() -> some View {
        HStack {
            controlButtonView(text: "Apply") {
                viewModel.applyFilter()
            }

            Spacer()

            controlButtonView(text: "Reset") {
                viewModel.resetFilter()
            }
        }
        .frame(maxWidth: .infinity, alignment: .center)
    }
}

struct TransactionFilterView_Previews: PreviewProvider {

    static var previews: some View {
        TransactionFilterView(viewModel: TransactionFilterViewModelBuilder.buildMock())
    }
}
