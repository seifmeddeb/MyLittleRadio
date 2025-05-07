// Copyright © Radio France. All rights reserved.

import ComposableArchitecture

@Reducer
struct StationsFeature {

    @ObservableState
    struct State: Equatable {
        var stations: [StationViewModel] = []
        var path = StackState<StationDetailFeature.State>()
    }

    enum Action {
        case fetchStations
        case setStations([StationViewModel])
        case stationTapped(StationViewModel)
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
                    // Append a new StationDetailFeature.State when tapping on a station
                    let stationDetailState = StationDetailFeature.State(viewModel: viewModel)
                    state.path.append(stationDetailState)  // Adding the detail state to path stack
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
