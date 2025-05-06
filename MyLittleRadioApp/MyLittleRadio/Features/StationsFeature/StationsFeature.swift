// Copyright © Radio France. All rights reserved.

import ComposableArchitecture

@Reducer
struct StationsFeature {

    @ObservableState
    struct State: Equatable {
        var stations: [StationViewModel] = []
    }

    enum Action {
        case fetchStations
        case setStations([StationViewModel])

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

                case .task:
                    return .run { send in
                        await send(.fetchStations)
                    }
            }
        }
    }
}
