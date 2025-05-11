// Copyright © Radio France. All rights reserved.

import ComposableArchitecture
import Testing

@testable import MyLittleRadio

@Suite
struct StationsFeatureTests {
    
    @Test
    func testFetchStationsSetsStoresCorrectly() async {
        // Given
        
        let mockStations = [
            Station.mock(id: "1", title: "France Inter"),
            Station.mock(id: "2", title: "FIP")
        ]
        let viewModels = mockStations.map(StationViewModel.init(from:))

        let store = await TestStore(initialState: StationsFeature.State()) {
            StationsFeature()
        } withDependencies: {
            $0.apiClient.fetchStations = { mockStations }
        }

        // When
        await store.send(.fetchStations) 

        // Then
        await store.receive(\.setStations) {
            $0.stations = viewModels
        }
    }

    @Test
    func testStationTappedAddsStationDetailFeatureToPath() async {
        // Given
        let station = Station.mock(id: "1", title: "France Inter")
        let viewModel = StationViewModel(from: station)
        let store = await TestStore(initialState: StationsFeature.State()) {
            StationsFeature()
        }
        
        let stationDetailState = StationDetailFeature.State(
            viewModel: viewModel,
            isPlaying: false
        )

        // When
        await store.send(.stationTapped(viewModel)) {
            // Then
            $0.path.append(stationDetailState)
        }
    }
    
    @Test
    func testDisplayCurrentlyPlayingStationAddsStationDetailFeatureToPath() async {
        // Given
        let station = Station.mock(id: "1", title: "France Inter")
        let viewModel = StationViewModel(from: station)
        let stationDetailState = StationDetailFeature.State(
            viewModel: viewModel,
            isPlaying: true
        )
        let initialState = StationsFeature.State(
            path: StackState([stationDetailState]),
            currentlyPlayingStation: viewModel
        )

        let store = await TestStore(initialState: initialState) {
            StationsFeature()
        }

        // When
        await store.send(.displayCurrentlyPlayingStation) {
            // Then
            $0.path.append(stationDetailState)
        }
    }
    

    @Test
    func testStartedPlayingUpdatesCurrentStation() async {
        // Given
        let station = Station.mock(id: "1", title: "France Inter")
        let viewModel = StationViewModel(from: station)
        let stationDetailState = StationDetailFeature.State(
            viewModel: viewModel,
            isPlaying: false
        )
        let initialState = StationsFeature.State(path: StackState([stationDetailState]))
        let store = await TestStore(initialState: initialState) {
            StationsFeature()
        }

        // When
        await store.send(.path(.element(id: 0, action: .delegate(.startedPlaying(viewModel))))) {
            // Then
            $0.currentlyPlayingStation = viewModel
        }
    }

    @Test
    func testStoppedPlayingClearsCurrentStation() async {
        // Given
        let station = Station.mock(id: "1", title: "France Inter")
        let viewModel = StationViewModel(from: station)
        let stationDetailState = StationDetailFeature.State(
            viewModel: viewModel,
            isPlaying: false
        )
        let initialState = StationsFeature.State(
            path: StackState([stationDetailState]),
            currentlyPlayingStation: viewModel
        )

        let store = await TestStore(initialState: initialState) {
            StationsFeature()
        }

        // When
        await store.send(.path(.element(id: 0, action: .delegate(.stoppedPlaying)))) {
            // Then
            $0.currentlyPlayingStation = nil
        }
    }
}
