// Copyright © Radio France. All rights reserved.

import SwiftUI

struct AsyncImageView: View {
    var url: URL?

    var body: some View {
        AsyncImage(url: url) { image in
            image.resizable()
                 .scaledToFit()
        } placeholder: {
            Image(systemName: "radio.fill")
                .resizable()
                .scaledToFit()
                .foregroundColor(.white.opacity(0.5))
        }
    }
}
