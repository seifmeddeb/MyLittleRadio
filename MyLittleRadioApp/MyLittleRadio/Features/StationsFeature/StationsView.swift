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
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 16) {
                        ForEach(store.stations) { item in
                            GeometryReader { geo in
                                let minX = geo.frame(in: .global).minX
                                let screenWidth = UIScreen.main.bounds.width
                                let distanceFromCenter = abs(minX - screenWidth / 2 + 150)
                                let scale = max(0.9, 1.1 - (distanceFromCenter / screenWidth))

                                Button {
                                    store.send(.stationTapped(item))
                                } label: {
                                    StationCardView(viewModel: item)
                                        .scaleEffect(scale)
                                        .animation(.easeOut(duration: 2), value: scale)
                                }
                                .buttonStyle(.plain)
                            }
                            .frame(width: 300)
                        }

                    }
                    .padding()
                }
                .navigationTitle("My Little Radio")
            } destination: { store in
                StationDetailView(store: store)
            }
            .task {
                store.send(.task)
            }
        }
    }
}
