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
        static let mainColor = UIAppConstants.AppColors.defaultBasic
        static let mainShadowColor = UIAppConstants.AppColors.defaultShadow

        static let titleText = String(localized: "Key: Filter")
        static let categoryTitleText = String(localized: "Key: Category")
        static let elementPadding: CGFloat = 30

        static let controlButtonSize: CGSize = .init(width: 150, height: 50)
        static let controlButtonCornerRadius: CGFloat = 15
        static let controlButtonShadowRadius: CGFloat = 5
        static let applyButtonText = String(localized: "Key: Apply")
        static let resetButtonText = String(localized: "Key: Reset")

    }

    @StateObject var viewModel: TransactionFilterViewModel

    var body: some View {
        VStack {
            headerView()

            subHeaderView(text: Constants.categoryTitleText)

            VStack {
                ForEach(viewModel.allCategories.sorted(by: <)) { category in
                    Toggle(
                        category.category.getRawValueWithLocalization(),
                        isOn: Binding(
                            get: { category.isSelected },
                            set: { newValue in
                                viewModel.allCategories.remove(category)
                                viewModel.allCategories.insert(
                                    .init(
                                        category: category.category,
                                        isSelected: newValue
                                    )
                                )
                            }
                        )
                    )
                    .foregroundColor(Constants.mainColor)
                    .tint(Constants.mainAdvancedColor)
                }
            }

            Spacer()

            footerView()

        }
        .padding(Constants.elementPadding)
        .background(Constants.mainBackgroundColor)
        .interactiveDismissDisabled()
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
            .padding([.top, .bottom], Constants.elementPadding)
    }

    func footerView() -> some View {
        HStack {
            controlButtonView(text: Constants.applyButtonText) {
                viewModel.applyFilter()
            }

            Spacer()

            controlButtonView(text: Constants.resetButtonText) {
                viewModel.resetFilter()
            }
        }
    }

    func controlButtonView(text: String, action: @escaping () -> Void) -> some View {
        Button(text) {
           action()
        }
        .frame(
            width: Constants.controlButtonSize.width,
            height: Constants.controlButtonSize.height
        )
        .background(Constants.mainAdvancedColor)
        .foregroundColor(Constants.mainColor)
        .clipShape(
            RoundedRectangle(
                cornerRadius: Constants.controlButtonCornerRadius
            )
        )
        .shadow(
            color: Constants.mainShadowColor,
            radius: Constants.controlButtonShadowRadius
        )
    }
}

struct TransactionFilterView_Previews: PreviewProvider {

    static var previews: some View {
        TransactionFilterView(
            viewModel: TransactionFilterViewModelBuilder.buildMock()
        )
    }
}
