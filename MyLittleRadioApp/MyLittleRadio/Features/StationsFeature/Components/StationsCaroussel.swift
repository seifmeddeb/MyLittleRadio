// Copyright © Radio France. All rights reserved.

import SwiftUI
import ComposableArchitecture

struct StationsCaroussel: View {
    
    var stations: [StationViewModel] = []
    var action: (StationViewModel) -> Void?
    
    var body: some View {
        WithPerceptionTracking {
            ScrollView(.horizontal, showsIndicators: false) {
                WithPerceptionTracking {
                    LazyHStack(spacing: 16) {
                        WithPerceptionTracking {
                            ForEach(stations) { item in
                                GeometryReader { geo in
                                    WithPerceptionTracking {
                                        let minX = geo.frame(in: .global).minX
                                        let screenWidth = UIScreen.main.bounds.width
                                        let distanceFromCenter = abs(minX - screenWidth / 2 + 150)
                                        let scale = max(0.9, 1.1 - (distanceFromCenter / screenWidth))
                                        
                                        Button {
                                            action(item)
                                        } label: {
                                            WithPerceptionTracking {
                                                StationInfoRow(viewModel: item)
                                                    .scaleEffect(scale)
                                                    .animation(.easeOut(duration: 2), value: scale)
                                            }
                                        }
                                        .buttonStyle(.plain)
                                    }
                                }
                                .frame(width: 300)
                            }
                        }
                    }
                    .padding()
                }
            }
        }
    }
}
#Preview {
    StationsCaroussel(stations: [
        StationViewModel(
            id: UUID().uuidString,
            title: "ICI",
            shortTitle: "ICI",
            streamUrl: nil,
            imageURL: nil,
            primaryColor: .blue
        ),
        StationViewModel(
            id: UUID().uuidString,
            title: "ICI",
            shortTitle: "ICI",
            streamUrl: nil,
            imageURL: nil,
            primaryColor: .blue
        )
    ], action: {_ in })
}
