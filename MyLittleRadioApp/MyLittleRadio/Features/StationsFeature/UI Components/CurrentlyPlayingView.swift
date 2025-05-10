// Copyright © Radio France. All rights reserved.

import SwiftUI

struct CurrentlyPlayingView: View {
    
    private var title: String
    private var imageURL: URL?
    private var opacity: Double
    private var backgroundColor: Color
    
    init(stationViewModel: StationViewModel?) {
        self.title = stationViewModel?.title ?? ""
        self.imageURL = stationViewModel?.imageURL
        self.opacity = stationViewModel == nil ? 0 : 1
        self.backgroundColor = stationViewModel?.secondaryColor ?? .black
    }
    
    var body: some View {
        ZStack {
            HStack(spacing: 20) {
                
                AsyncImageView(url: imageURL)
                    .frame(width: 30, height: 30)
                    .background(backgroundColor)
                    .cornerRadius(4)
                
                VStack(alignment: .leading) {
                    Text("Vous écoutez :")
                        .font(
                            .custom(
                                "AvenirNext-Bold",
                                size: 12
                            )
                        )
                        .foregroundColor(.white)
                    Text(title)
                        .font(
                            .custom(
                                "AvenirNext-Bold",
                                size: 20
                            )
                        )
                        .foregroundColor(.white)
                }
                
                Spacer()
                
                Image(systemName: "megaphone.fill")
                    .foregroundColor(.white)
            }
            .padding(.horizontal, 20)
            .frame(height: 50)
            .background(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(.white, lineWidth: 1)
            )
        }
        .padding(16)
        .opacity(opacity)
    }
}

#Preview {
    CurrentlyPlayingView(stationViewModel:
        StationViewModel(
            id: UUID().uuidString,
            title: "ICI",
            shortTitle: "ICI",
            streamUrl: nil,
            imageURL: nil,
            primaryColor: .blue
        )
    )
    .background(.black)
}
