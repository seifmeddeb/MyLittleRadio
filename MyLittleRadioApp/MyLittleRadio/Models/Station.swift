// Copyright © Radio France. All rights reserved.

import Foundation

struct Station: Equatable, Identifiable {
    
    let id: String
    let brandId: String
    let title: String
    let hasTimeshift: Bool
    let shortTitle: String
    let type: String
    let streamUrl: String
    let liveRule: String
    let primaryColor: String
    let isMusical: Bool
    let imageUrl: String
    
    // MARK: - Init
    
    init(from response: StationResponse) {
        self.id = response.id ?? ""
        self.brandId = response.brandId ?? ""
        self.title = response.title ?? ""
        self.hasTimeshift = response.hasTimeshift ?? false
        self.shortTitle = response.shortTitle ?? ""
        self.type = response.type ?? ""
        self.streamUrl = response.streamUrl ?? ""
        self.liveRule = response.liveRule ?? ""
        self.primaryColor = response.colors?.primary ?? ""
        self.isMusical = response.isMusical ?? false
        self.imageUrl = response.assets?.squareImageUrl ?? ""
    }
    
    init(
        id: String,
        brandId: String,
        title: String,
        hasTimeshift: Bool,
        shortTitle: String,
        type: String,
        streamUrl: String,
        liveRule: String,
        primaryColor: String,
        isMusical: Bool,
        imageUrl: String
    ) {
        self.id = id
        self.brandId = brandId
        self.title = title
        self.hasTimeshift = hasTimeshift
        self.shortTitle = shortTitle
        self.type = type
        self.streamUrl = streamUrl
        self.liveRule = liveRule
        self.primaryColor = primaryColor
        self.isMusical = isMusical
        self.imageUrl = imageUrl
    }

}
