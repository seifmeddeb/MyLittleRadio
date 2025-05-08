// Copyright © Radio France. All rights reserved.

import SwiftUI

struct NavigationBarStyle: ViewModifier {
    var backgroundColor: UIColor
    var titleColor: UIColor
    var font: UIFont

    init(backgroundColor: UIColor, titleColor: UIColor, font: UIFont) {
        self.backgroundColor = backgroundColor
        self.titleColor = titleColor
        self.font = font

        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.largeTitleTextAttributes = [
            .foregroundColor: titleColor,
            .font: font
        ]
        appearance.backgroundColor = backgroundColor

        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }

    func body(content: Content) -> some View {
        content
    }
}

extension View {
    func navigationBarStyle(
        backgroundColor: UIColor = .black,
        titleColor: UIColor = .white,
        font: UIFont = UIFont(name: "AvenirNext-Bold", size: 34)!
    ) -> some View {
        self.modifier(NavigationBarStyle(
            backgroundColor: backgroundColor,
            titleColor: titleColor,
            font: font
        ))
    }
}
