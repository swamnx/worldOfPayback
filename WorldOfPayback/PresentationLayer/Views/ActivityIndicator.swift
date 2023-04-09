//
//  LoaderView.swift
//  WorldOfPayback
//
//  Created by swamnx on 9.04.23.
//

import Foundation
import SwiftUI

//This view is not mine, i took it from StackOverflow

struct ActivityIndicator: View {

    private enum Constants {
        static let mainColor = UIAppConstants.AppColors.defaultBasic
    }

    @State private var isAnimating: Bool = false

    var body: some View {
        GeometryReader { (geometry: GeometryProxy) in
            ForEach(0..<5) { index in
                Group {
                    Circle()
                        .frame(
                            width: geometry.size.width / 5,
                            height: geometry.size.height / 5
                        )
                        .scaleEffect(calcScale(index: index))
                        .offset(y: calcYOffset(geometry))
                }
                .frame(
                    width: geometry.size.width,
                    height: geometry.size.height
                )
                .rotationEffect(!self.isAnimating ? .degrees(0) : .degrees(360))
                .animation(
                    .timingCurve(0.5, 0.15 + Double(index) / 5, 0.25, 1, duration: 1.5)
                    .repeatForever(autoreverses: false)
                )
            }
        }
        .foregroundColor(Constants.mainColor)
        .aspectRatio(1, contentMode: .fit)
        .onAppear {
            self.isAnimating = true
        }
    }

    func calcScale(index: Int) -> CGFloat {
        return (!isAnimating ? 1 - CGFloat(Float(index)) / 5 : 0.2 + CGFloat(index) / 5)
    }

    func calcYOffset(_ geometry: GeometryProxy) -> CGFloat {
        return geometry.size.width / 10 - geometry.size.height / 2
    }

}

struct ActivityIndicator_Previews: PreviewProvider {
    static var previews: some View {
        ActivityIndicator()
    }
}