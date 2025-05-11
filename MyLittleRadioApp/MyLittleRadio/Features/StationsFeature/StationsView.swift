// Copyright © Radio France. All rights reserved.

import SwiftUI

import ComposableArchitecture

struct StationsView: View {
    
    @Perception.Bindable private var store: StoreOf<StationsFeature>
    
    // MARK: - Init
    
    init(store: StoreOf<StationsFeature>) {
        self.store = store
    }
    
    var body: some View {
        WithPerceptionTracking {
            NavigationStackStore(
                store.scope(state: \.path, action: \.path)
            ) {
                VStack {
                        CurrentlyPlayingView(
                            stationViewModel: store.currentlyPlayingStation,
                            action: {
                                store.send(.displayCurrentlyPlayingStation)
                            }
                        )
                        
                        StationsCaroussel(stations: store.stations) { item in
                            store.send(.stationTapped(item))
                        }
                }
                .background(.black)
                .navigationTitle("Bonjour")
                .navigationBarLargeTitleStyle()
            } destination: { store in
                WithPerceptionTracking {
                    StationDetailView(store: store)
                }
            }
            .task {
                store.send(.task)
            }
        }
    }
}

#Preview {
    StationsView(
        store: Store<StationsFeature.State, StationsFeature.Action>(
            initialState: StationsFeature.State(
                stations: [
                    StationViewModel(
                        id: UUID().uuidString,
                        title: "ICI",
                        shortTitle: "ICI",
                        streamUrl: nil,
                        imageURL: nil,
                        primaryColor: .blue
                    )
                ]
            ),
            reducer: {
                StationsFeature()
            }
        )
    )
}

