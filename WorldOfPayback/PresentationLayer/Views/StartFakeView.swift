//
//  StartFakeView.swift
//  WorldOfPayback
//
//  Created by swamnx on 7.04.23.
//

import SwiftUI

struct StartFakeView: View {

    private enum Constants {

        static let mainBackgroundColor = UIAppConstants.AppColors.defaultBackground
        static let elementPadding: CGFloat = 15
    }

    let titleText: String

    var body: some View {
        ScrollView(.vertical) {
            VStack(spacing: 0) {
                Spacer(minLength: Constants.elementPadding)
                UnreleasedFeatureView()
                Spacer(minLength: Constants.elementPadding)
            }
        }
        .background(Constants.mainBackgroundColor)
        .safeAreaInset(edge: .top) {
            TopHeaderView(
                titleText: titleText
            )
        }
    }
}

struct FakeScreenView_Previews: PreviewProvider {

    static var previews: some View {
        StartFakeView(titleText: "Preview Header")
    }
}
