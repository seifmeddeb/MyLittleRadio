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
                    LazyHStack(spacing: 16) {
                        WithPerceptionTracking {
                            let stations = store.stations
                            ForEach(stations) { item in
                                GeometryReader { geo in
                                    WithPerceptionTracking {
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
                                }
                                .frame(width: 300)
                            }
                        }
                    }
                    .padding()
                }
                .background(.black)
                .navigationTitle("Bonjour")
            } destination: { store in
                WithPerceptionTracking {
                    StationDetailView(store: store)
                }
            }
            .navigationBarStyle()
            .task {
                store.send(.task)
            }
        }
    }
}

