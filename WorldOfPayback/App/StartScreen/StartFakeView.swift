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
        static let titlePadding: CGFloat = 30
        static let elementPadding: CGFloat = 15
    }

    let titleText: String

    var body: some View {
        ScrollView(.vertical) {
            VStack {
                Spacer(minLength: Constants.elementPadding)
                UnreleasedFeatureView()
                Spacer(minLength: Constants.elementPadding)
            }
        }
        .background(Constants.mainBackgroundColor)
        .safeAreaInset(edge: .top) {
            TopHeaderView(
                titleText: titleText,
                elementPadding: Constants.titlePadding
            )
        }
    }
}

struct FakeScreenView_Previews: PreviewProvider {

    static var previews: some View {
        StartFakeView(titleText: "Preview Header")
    }
}
