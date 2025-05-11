// Copyright © Radio France. All rights reserved.

import SwiftUI

import ComposableArchitecture

struct StationDetailView: View {
    @Perception.Bindable var store: StoreOf<StationDetailFeature>
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        WithPerceptionTracking {
            VStack(spacing: 20) {
                AsyncImageView(url: store.viewModel.imageURL)
                    .frame(
                        maxWidth: .infinity,
                        maxHeight: 300
                    )
                    .padding(50)
                    .background(store.viewModel.primaryColor)
                
                HStack(spacing: 20) {
                    
                    Image(systemName: store.viewModel.categorySymbolName)
                        .foregroundColor(.white)
                    
                    Text(store.viewModel.title)
                        .font(
                            .custom(
                                "AvenirNext-Bold",
                                size: 20
                            )
                        )
                        .foregroundColor(.white)
                    
                    Spacer()
                    
                    AudioControlsView(store: store)
                }
                .padding(16)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.black)
            .navigationTitle(store.viewModel.shortTitle)
            .navigationBarInlineTitleStyle()
            .modifier(CustomBackButton(action: {
                dismiss()
            }))
        }
    }
}

#Preview {
    StationDetailView(
        store: Store(
            initialState: StationDetailFeature.State(
                viewModel: StationViewModel(
                    id: UUID().uuidString,
                    title: "ICI",
                    shortTitle: "ICI",
                    streamUrl: nil,
                    imageURL: nil,
                    primaryColor: .blue
                )
            ),
            reducer: { StationDetailFeature()
            }
        )
    )
}
