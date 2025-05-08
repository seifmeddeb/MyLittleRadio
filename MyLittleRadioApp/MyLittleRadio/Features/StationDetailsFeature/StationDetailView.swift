// Copyright © Radio France. All rights reserved.

import SwiftUI

import ComposableArchitecture

struct StationDetailView: View {
    @Perception.Bindable var store: StoreOf<StationDetailFeature>
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        WithPerceptionTracking {
            VStack {
                Button("Play Stream") {
                    store.send(.playButtonTapped(store.viewModel.streamUrl))
                }
                .padding()
                
                Button("Stop Stream") {
                    store.send(.stopButtonTapped)
                }
                .padding()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.black)
            .navigationTitle(store.viewModel.title)
            .navigationBarInlineTitleStyle()
            .modifier(CustomBackButton(action: {
                dismiss()
            }))
        }
    }
}
