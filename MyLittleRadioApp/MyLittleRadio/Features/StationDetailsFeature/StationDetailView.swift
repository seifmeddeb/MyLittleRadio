// Copyright © Radio France. All rights reserved.

import SwiftUI

import ComposableArchitecture

struct StationDetailView: View {
    @Perception.Bindable var store: StoreOf<StationDetailFeature>
    
    var body: some View {
        WithPerceptionTracking {
            VStack {
                Text(store.viewModel.title)
                    .padding()
                Button("Play Stream") {
                    store.send(.playButtonTapped(store.viewModel.streamUrl))
                }
                .padding()
                
                Button("Stop Stream") {
                    store.send(.stopButtonTapped)
                }
                .padding()
            }
        }
    }
}
