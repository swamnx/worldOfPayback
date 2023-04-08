//
//  WorldOfPaybackApp.swift
//  WorldOfPayback
//
//  Created by swamnx on 7.04.23.
//

import SwiftUI

@main
struct WorldOfPaybackApp: App {

    private enum Constants {
        static let mainColor = UIAppConstants.AppColors.defaultBasic
        static let mainBackgroundColor = UIAppConstants.AppColors.defaultBackground
        static let tabItemUnselectedColor = UIAppConstants.AppColors.defaultBasic
        static let tabItemSelectedColor = UIAppConstants.AppColors.defaultAccent
    }

    var body: some Scene {
        WindowGroup {
            StartView()
        }
    }

    init() {
        setUpDefaultTabBarAppearance()
    }

    func setUpDefaultTabBarAppearance() {
        let appereance = UITabBarAppearance()
        let itemAppearance = UITabBarItemAppearance()
        appereance.configureWithTransparentBackground()
        appereance.backgroundEffect = UIBlurEffect(style: .systemUltraThinMaterial)
        itemAppearance.normal.iconColor = .init(Constants.mainColor)
        itemAppearance.selected.iconColor = .init(Constants.tabItemSelectedColor)
        itemAppearance.normal.titleTextAttributes[.foregroundColor] = UIColor(Constants.mainColor)
        itemAppearance.selected.titleTextAttributes[.foregroundColor] = UIColor(Constants.tabItemSelectedColor)
        appereance.inlineLayoutAppearance = itemAppearance
        appereance.stackedLayoutAppearance = itemAppearance
        appereance.compactInlineLayoutAppearance = itemAppearance
        UITabBar.appearance().standardAppearance = appereance
        UITabBar.appearance().scrollEdgeAppearance = appereance
    }
}
