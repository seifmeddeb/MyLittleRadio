// Copyright © Radio France. All rights reserved.

import Foundation
import ComposableArchitecture
import Testing

@testable import MyLittleRadio

@Suite
struct StationDetailFeatureTests {
    
    @Test
    func testPlayButtonTappedStartsAudio() async {
        // Given
        
        let viewModel = StationViewModel(from: Station.mock())

        let store = await TestStore(initialState: StationDetailFeature.State(viewModel: viewModel)) {
            StationDetailFeature()
        } withDependencies: {
            $0.audioClient.play = { _ in }
        }

        // When / Then
        await store.send(.playButtonTapped(viewModel.streamUrl)) {
            $0.isLoading = true
        }

        await store.receive(\.didStartPlaying) {
            $0.isLoading = false
            $0.isPlaying = true
        }

        await store.receive(.delegate(.startedPlaying(viewModel)))
    }
    
    @Test
        func testStopButtonTappedStopsAudio() async {
            // Given
            let viewModel = StationViewModel(from: Station.mock())

            let store = await TestStore(
                initialState: StationDetailFeature.State(
                    viewModel: viewModel,
                    isPlaying: true
                )
            ) {
                StationDetailFeature()
            } withDependencies: {
                $0.audioClient.stop = {}
            }

            // When / Then
            await store.send(.stopButtonTapped) {
                $0.isLoading = true
            }

            await store.receive(.didStopPlaying) {
                $0.isLoading = false
                $0.isPlaying = false
            }

            await store.receive(.delegate(.stoppedPlaying))
        }
}
