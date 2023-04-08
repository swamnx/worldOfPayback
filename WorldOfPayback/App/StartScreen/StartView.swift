//
//  ContentView.swift
//  WorldOfPayback
//
//  Created by swamnx on 7.04.23.
//

import SwiftUI

struct StartView: View {

    private enum Constants {

        static let feedItemText = String(localized: "FeedHeadText")
        static let transactionsItemText = String(localized: "TransactionsHeadText")
        static let shoppingItemText = String(localized: "ShoppingHeadText")
        static let settingsItemText = String(localized: "SettingsHeadText")

        static let feetItemSystemIconName = "note"
        static let transactionsItemSystemIconName = "list.bullet.rectangle"
        static let shoppingItemSystemIconName = "basket"
        static let settingsItemSystemIconName = "gearshape"
    }

    var body: some View {
        TabView {
            StartFakeView(titleText: Constants.feedItemText)
                .tabItem {
                    Label(
                        Constants.feedItemText,
                        systemImage: Constants.feetItemSystemIconName
                    )
                }
            TransactionsView(
                titleText: Constants.transactionsItemText,
                viewModel: TransactionsViewModelBuilder().build()
            )
                .tabItem {
                    Label(
                        Constants.transactionsItemText,
                        systemImage: Constants.transactionsItemSystemIconName
                    )
                }
            StartFakeView(titleText: Constants.shoppingItemText)
                .tabItem {
                    Label(
                        Constants.shoppingItemText,
                        systemImage: Constants.shoppingItemSystemIconName
                    )
                }
            StartFakeView(titleText: Constants.settingsItemText)
                .tabItem {
                    Label(
                        Constants.settingsItemText,
                        systemImage: Constants.settingsItemSystemIconName
                    )
                }
        }
    }

}
struct StartView_Previews: PreviewProvider {

    static var previews: some View {
        StartView()
    }
}