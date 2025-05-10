// Copyright © Radio France. All rights reserved.

import SwiftUI

struct StationCardView: View {
    
    var viewModel: StationViewModel
    
    var body: some View {
        VStack(spacing: 16) {
            
            HStack {
                Text(viewModel.shortTitle)
                    .font(
                        .custom(
                            "AvenirNext-Bold",
                            size: 20
                        )
                    )
                    .foregroundColor(.white)
                
                Spacer()
                
                Image(systemName: viewModel.categorySymbolName)
                    .foregroundColor(.white)
                
            }
            
            AsyncImageView(url: viewModel.imageURL)
                .frame(
                    maxWidth: .infinity,
                    maxHeight: .infinity
                )
                .padding()
                .background(viewModel.primaryColor)
                .cornerRadius(12)
        }
        .padding()
        .frame(
            maxWidth: .infinity,
            maxHeight: .infinity
        )
        .background(viewModel.secondaryColor)
        .cornerRadius(12)
        .padding(.vertical, 20)
    }
}

#Preview {
    StationCardView(
        viewModel: StationViewModel(
            id: UUID().uuidString,
            title: "ICI",
            shortTitle: "ICI",
            streamUrl: nil,
            imageURL: nil,
            primaryColor: .blue
        )
    )
}
