// Copyright © Radio France. All rights reserved.

import SwiftUI
import ComposableArchitecture

struct AudioControlsView: View {
    @Perception.Bindable var store: StoreOf<StationDetailFeature>

    var body: some View {
        WithPerceptionTracking {
            VStack {
                if store.isLoading {
                    ProgressView()
                } else {
                    Button {
                        store.send(store.isPlaying ? .stopButtonTapped : .playButtonTapped(store.viewModel.streamUrl))
                    } label: {
                        Image(systemName: store.isPlaying ? "stop.fill" : "play.fill")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .foregroundColor(.black)
                            .padding()
                            .background(.white)
                            .clipShape(Circle())
                    }
                    .buttonStyle(.plain)
                }
            }
            .animation(.easeInOut, value: store.isLoading)
        }
    }
}
