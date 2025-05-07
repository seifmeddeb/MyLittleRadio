// Copyright © Radio France. All rights reserved.

import SwiftUI

import ComposableArchitecture

struct StationsView: View {
    
    @Perception.Bindable private var store: StoreOf<StationsFeature>
    
    init(store: StoreOf<StationsFeature>) {
        self.store = store
    }
    
    var body: some View {
        WithPerceptionTracking {
            NavigationStackStore(
                store.scope(state: \.path, action: \.path)
            ) {
                List {
                    ForEach(store.stations) { station in
                        HStack(spacing: 8) {
                            Button(station.title) {
                                store.send(.stationTapped(station))
                            }
                            Spacer()
                            Image(systemName: "chevron.right")
                        }
                        .frame(height: 50)
                    }
                }
                .navigationTitle("Stations")
            } destination: { store in
                StationDetailView(store: store)
            }
            .task {
                store.send(.task)
            }
        }
    }
}
