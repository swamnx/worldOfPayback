//
//  TopHeaderView.swift
//  WorldOfPayback
//
//  Created by swamnx on 8.04.23.
//

import SwiftUI

struct TopHeaderView: View {

    private enum Constants {
        static let mainColor = UIAppConstants.AppColors.defaultBasic
        static let elementPadding: CGFloat = 30
    }

    let titleText: String

    var body: some View {
        Text(titleText)
            .font(.largeTitle)
            .foregroundColor(Constants.mainColor)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(Constants.elementPadding)
            .background(.thinMaterial)
    }
}

struct TopHeaderView_Previews: PreviewProvider {

    static var previews: some View {
        TopHeaderView(titleText: "Some title")
            .previewLayout(.sizeThatFits)
    }
}
