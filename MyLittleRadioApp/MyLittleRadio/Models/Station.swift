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
    let analytics: Analytics
    let liveRule: String
    let colors: Colors
    let isMusical: Bool
    let assets: Assets?
    
    // MARK: - Init
    
    init(from response: StationResponse) {
        self.id = response.id ?? ""
        self.brandId = response.brandId ?? ""
        self.title = response.title ?? ""
        self.hasTimeshift = response.hasTimeshift ?? false
        self.shortTitle = response.shortTitle ?? ""
        self.type = response.type ?? ""
        self.streamUrl = response.type ?? ""
        self.analytics = Analytics(from: response.analytics)
        self.liveRule = response.type ?? ""
        self.colors = Colors(primary: response.colors?.primary ?? "")
        self.isMusical = response.isMusical ?? false
        self.assets = Assets(squareImageUrl: response.assets?.squareImageUrl ?? "")
    }
}

// MARK: - Analytics
struct Analytics: Equatable {
    let value: String
    let stationAudienceId: Int
    
    init(from response: AnalyticsResponse?) {
        self.value = response?.value ?? ""
        self.stationAudienceId = response?.stationAudienceId ?? 0
    }
}

// MARK: - Assets
struct Assets: Equatable {
    let squareImageUrl: String
}

// MARK: - Colors
struct Colors: Equatable {
    let primary: String
}
