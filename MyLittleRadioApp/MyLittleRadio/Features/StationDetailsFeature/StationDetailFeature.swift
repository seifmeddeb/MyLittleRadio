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

    enum Action {
        case playButtonTapped
        case stopButtonTapped
    }
    
    // MARK: - Dependencies

    @Dependency(\.audioClient)
    private var audioClient

    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .playButtonTapped:
                return .run { [state] _ in
                    do {
                        try await audioClient.play(state.viewModel.streamUrl)
                    } catch {
                        print("❌ Error playing stream: \(error)")
                    }
                }

            case .stopButtonTapped:
                return .run { _ in
                    do {
                        try await audioClient.stop()
                    } catch {
                        print("❌ Error stopping stream: \(error)")
                    }
                }
            }
        }
    }
}
