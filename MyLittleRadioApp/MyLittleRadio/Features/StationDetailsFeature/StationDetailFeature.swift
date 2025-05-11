// Copyright © Radio France. All rights reserved.

import Foundation
import ComposableArchitecture

@Reducer
struct StationDetailFeature {

    @ObservableState
    struct State: Equatable, Hashable {
        let viewModel: StationViewModel
        var isPlaying = false
        var isLoading = false
    }

    enum Action: Equatable {
        case playButtonTapped(URL?)
        case stopButtonTapped
        case didStartPlaying
        case didStopPlaying
        case delegate(DelegateAction)

        enum DelegateAction: Equatable {
                case startedPlaying(StationViewModel)
                case stoppedPlaying
            }
    }
    
    // MARK: - Dependencies

    @Dependency(\.audioClient)
    private var audioClient

    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case let .playButtonTapped(streamUrl):
                state.isLoading = true
                return .run { send in
                    do {
                        try await audioClient.play(streamUrl)
                        await send(.didStartPlaying)
                    } catch {
                        print("❌ Error playing stream: \(error)")
                    }
                }

            case .stopButtonTapped:
                state.isLoading = true
                return .run { send in
                    do {
                        try await audioClient.stop()
                        await send(.didStopPlaying)
                    } catch {
                        print("❌ Error stopping stream: \(error)")
                    }
                }
                
            case .didStartPlaying:
                state.isLoading = false
                state.isPlaying = true
                return .send(.delegate(.startedPlaying(state.viewModel)))
                
            case .didStopPlaying:
                state.isLoading = false
                state.isPlaying = false
                return .send(.delegate(.stoppedPlaying))
                
            case .delegate:
                return .none
            }
        }
    }
}
