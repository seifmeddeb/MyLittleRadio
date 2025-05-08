// Copyright © Radio France. All rights reserved.

import SwiftUI

struct StationCardView: View {
    
    var viewModel: StationViewModel
    
    var body: some View {
        VStack(spacing: 16) {
            
            Text(viewModel.title)
                .font(
                    .system(
                        size: 20,
                        weight: .bold
                    )
                )
                .foregroundColor(.white)
            
            AsyncImage(url: viewModel.imageURL) { image in
                    image.resizable()
                         .scaledToFit()
                         .frame(height: 200)
                         .cornerRadius(12)
                } placeholder: {
                    Image(systemName: "radio.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 200)
                        .foregroundColor(.white.opacity(0.5))
                }
                .frame(
                    maxWidth: .infinity,
                    maxHeight: .infinity
                )
                .background(viewModel.primaryColor)
                .cornerRadius(12)
        }
        .padding()
        .frame(
            maxWidth: .infinity,
            maxHeight: .infinity
        )
        .background(viewModel.primaryColor.opacity(0.8))
        .cornerRadius(12)
        .padding(.vertical, 16)
    }
}

#Preview {
    StationCardView(
        viewModel: StationViewModel(
            id: UUID().uuidString,
            title: "ICI",
            streamUrl: nil,
            imageURL: nil,
            primaryColor: .blue
        )
    )
}
