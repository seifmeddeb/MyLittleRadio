// Copyright © Radio France. All rights reserved.

import ComposableArchitecture
import Foundation

@Reducer
struct StationsFeature {

    @ObservableState
    struct State: Equatable {
        var stations: [StationViewModel] = []
        var path = StackState<StationDetailFeature.State>()
        var currentlyPlayingStation: StationViewModel? = nil
    }

    enum Action: Equatable {
        case fetchStations
        case setStations([StationViewModel])
        case stationTapped(StationViewModel)
        case displayCurrentlyPlayingStation
        case path(StackAction<StationDetailFeature.State, StationDetailFeature.Action>)
        case task
    }

    // MARK: - Dependencies

    @Dependency(\.apiClient)
    private var apiClient

    var body: some ReducerOf<Self> {
        Reduce<State, Action> { state, action in
            switch action {
            case .fetchStations:
                return .run { send in
                    if let stations = try? await apiClient.fetchStations() {
                        let stationViewModels = stations.map { StationViewModel(from: $0) }
                        await send(.setStations(stationViewModels))
                    }
                }
            case let .setStations(stations):
                state.stations = stations
                return .none
                
            case let .stationTapped(viewModel):
                let isCurrentlyPlaying = viewModel == state.currentlyPlayingStation
                let stationDetailState = StationDetailFeature.State(
                    viewModel: viewModel,
                    isPlaying: isCurrentlyPlaying
                )
                state.path.append(stationDetailState)
                return .none
                
            case .displayCurrentlyPlayingStation:
                guard let station = state.currentlyPlayingStation else { return .none }
                
                let stationDetailState = StationDetailFeature.State(
                    viewModel: station,
                    isPlaying: true
                )
                state.path.append(stationDetailState)
                return .none
                
            case let .path(.element(_, .delegate(.startedPlaying(station)))):
                state.currentlyPlayingStation = station
                return .none
                
            case .path(.element(_, .delegate(.stoppedPlaying))):
                state.currentlyPlayingStation = nil
                return .none
                
            case .path:
                return .none
                
            case .task:
                return .run { send in
                    await send(.fetchStations)
                }
            }
        }
        .forEach(\.path, action: \.path) {
            StationDetailFeature()
        }
    }
}
