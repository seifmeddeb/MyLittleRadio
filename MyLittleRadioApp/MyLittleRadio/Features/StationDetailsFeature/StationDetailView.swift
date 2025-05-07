// Copyright © Radio France. All rights reserved.

import SwiftUI

import ComposableArchitecture

struct StationDetailView: View {
    @Perception.Bindable var store: StoreOf<StationDetailFeature>
    
    var body: some View {
        WithPerceptionTracking {
            VStack {
                Text(store.viewModel.title)
            }
        }
    }
}
