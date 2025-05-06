// Copyright © Radio France. All rights reserved.

import Foundation

struct StationListResponse: Codable {
    let stations: [StationResponse]
}

struct StationResponse: Codable {
    let id: String?
    let brandId: String?
    let title: String?
    let hasTimeshift: Bool?
    let shortTitle: String?
    let type: String?
    let streamUrl: String?
    let analytics: AnalyticsResponse?
    let liveRule: String?
    let colors: ColorsResponse?
    let isMusical: Bool?
    let assets: AssetsResponse?
}

// MARK: - Analytics
struct AnalyticsResponse: Codable {
    let value: String?
    let stationAudienceId: Int?
}

// MARK: - Assets
struct AssetsResponse: Codable {
    let squareImageUrl: String?
}

// MARK: - Colors
struct ColorsResponse: Codable {
    let primary: String?
}
