//
//  StartFakeView.swift
//  WorldOfPayback
//
//  Created by swamnx on 7.04.23.
//

import SwiftUI

struct StartFakeView: View {

    private enum Constants {
        static let mainColor = UIAppConstants.AppColors.defaultBasic
        static let mainBackgroundColor = UIAppConstants.AppColors.defaultBackground
        static let mainAccentColor = UIAppConstants.AppColors.defaultAccent
        static let mainShadowColor = UIAppConstants.AppColors.defaultShadow
        static let elementPadding: CGFloat = 30
    }

    let titleText: String

    var body: some View {
        ScrollView(.vertical) {
            Spacer()
            UnreleasedFeatureView()
                .padding(Constants.elementPadding)
            Spacer()
        }
        .background(Constants.mainBackgroundColor)
        .safeAreaInset(edge: .top) {
            TopHeaderView(
                titleText: titleText,
                elementPadding: Constants.elementPadding
            )
        }
    }
}

struct FakeScreenView_Previews: PreviewProvider {

    static var previews: some View {
        StartFakeView(titleText: "Preview Header")
    }
}
