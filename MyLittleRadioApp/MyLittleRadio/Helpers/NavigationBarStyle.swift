// Copyright © Radio France. All rights reserved.

import SwiftUI

enum TitleDisplayMode {
    case large, inline
}

struct NavigationBarStyle: ViewModifier {
    
    var backgroundColor: UIColor
    var titleColor: UIColor
    var displayMode: TitleDisplayMode
    
    init(
        backgroundColor: UIColor,
        titleColor: UIColor,
        displayMode: TitleDisplayMode
    ) {
        self.backgroundColor = backgroundColor
        self.titleColor = titleColor
        self.displayMode = displayMode
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        
        appearance.largeTitleTextAttributes = [
            .foregroundColor: titleColor,
            .font: UIFont(name: "AvenirNext-Bold", size: 34)!
        ]
        appearance.titleTextAttributes = [
            .foregroundColor: titleColor,
            .font: UIFont(name: "AvenirNext-Bold", size: 20)!
        ]
        
        appearance.backgroundColor = backgroundColor
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }
    
    func body(content: Content) -> some View {
        content
            .navigationBarTitleDisplayMode(displayMode == .large ? .large : .inline)
    }
}

extension View {
    func navigationBarLargeTitleStyle(
        backgroundColor: UIColor = .black,
        titleColor: UIColor = .white,
        displayMode: TitleDisplayMode = .large
    ) -> some View {
        self.modifier(NavigationBarStyle(
            backgroundColor: backgroundColor,
            titleColor: titleColor,
            displayMode: displayMode
        ))
    }
    
    func navigationBarInlineTitleStyle(
        backgroundColor: UIColor = .black,
        titleColor: UIColor = .white,
        displayMode: TitleDisplayMode = .inline
    ) -> some View {
        self.modifier(NavigationBarStyle(
            backgroundColor: backgroundColor,
            titleColor: titleColor,
            displayMode: displayMode
        ))
    }
}
