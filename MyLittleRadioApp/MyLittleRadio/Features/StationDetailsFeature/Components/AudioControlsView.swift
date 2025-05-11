// Copyright © Radio France. All rights reserved.

import SwiftUI
import ComposableArchitecture

struct AudioControlsView: View {
    @Perception.Bindable var store: StoreOf<StationDetailFeature>

    var body: some View {
        WithPerceptionTracking {
            VStack {
                if store.isLoading {
                    WithPerceptionTracking {
                        ProgressView()
                            .tint(.white)
                    }
                } else {
                    Button {
                        store.send(store.isPlaying ? .stopButtonTapped : .playButtonTapped(store.viewModel.streamUrl))
                    } label: {
                        WithPerceptionTracking {
                            Image(systemName: store.isPlaying ? "stop.fill" : "play.fill")
                                .resizable()
                                .frame(width: 15, height: 15)
                                .foregroundColor(.black)
                                .padding()
                                .background(.white)
                                .clipShape(Circle())
                        }
                    }
                    .buttonStyle(.plain)
                }
            }
            .animation(.easeInOut, value: store.isLoading)
            .frame(width: 15, height: 15)
        }
    }
}
#Preview {
    AudioControlsView(
        store: Store(
            initialState: StationDetailFeature.State(
                viewModel: StationViewModel(
                    id: UUID().uuidString,
                    title: "ICI",
                    shortTitle: "ICI",
                    streamUrl: nil,
                    imageURL: nil,
                    primaryColor: .blue
                ),
                isPlaying: false,
                isLoading: false
            ),
            reducer: { StationDetailFeature() }
        )
    )
    .padding()
    .background(.gray)
}
