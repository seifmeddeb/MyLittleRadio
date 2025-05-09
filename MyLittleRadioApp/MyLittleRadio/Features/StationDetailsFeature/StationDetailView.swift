// Copyright © Radio France. All rights reserved.

import SwiftUI

import ComposableArchitecture

struct StationDetailView: View {
    @Perception.Bindable var store: StoreOf<StationDetailFeature>
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        WithPerceptionTracking {
            VStack(spacing: 20) {
                AudioControlsView(store: store)
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
