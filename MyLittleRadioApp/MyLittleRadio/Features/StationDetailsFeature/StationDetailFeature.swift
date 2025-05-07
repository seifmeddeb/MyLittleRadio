// Copyright © Radio France. All rights reserved.

import Foundation
import ComposableArchitecture

@Reducer
struct StationDetailFeature {

    @ObservableState
    struct State: Equatable, Hashable, Identifiable {
        let id = UUID()
        let viewModel: StationViewModel
    }

    enum Action {}

    var body: some ReducerOf<Self> {
        Reduce { state, action in
            .none
        }
    }
}
