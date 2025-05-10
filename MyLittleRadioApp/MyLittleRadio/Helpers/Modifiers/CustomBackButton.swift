// Copyright © Radio France. All rights reserved.

import SwiftUI

struct CustomBackButton: ViewModifier {
    var action: () -> Void
    
    func body(content: Content) -> some View {
        content
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: Button(action: action) {
                Image(systemName: "chevron.backward")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .font(.title)
                    .foregroundColor(.white)
            })
    }
}
