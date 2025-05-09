// Copyright © Radio France. All rights reserved.

import Foundation
import SwiftUI

struct StationViewModel: Equatable, Hashable, Identifiable {
    
    let id: String
    let title: String
    let shortTitle: String
    let streamUrl: URL?
    let imageURL: URL?
    let primaryColor: Color
    let secondaryColor: Color
    let categorySymbolName: String
    
    // MARK: - Init
    
    init(from station: Station) {
        self.id = station.id
        self.title = station.title
        self.shortTitle = station.shortTitle
        self.streamUrl = URL(string: station.streamUrl)
        self.imageURL = URL(string: station.imageUrl)
        self.primaryColor = Color(hex: station.primaryColor) ?? .blue
        self.secondaryColor = primaryColor.opacity(0.8)
        self.categorySymbolName = station.isMusical ? "music.note" : "newspaper.fill"
    }
    
    init(
        id: String,
        title: String,
        shortTitle: String,
        streamUrl: URL?,
        imageURL: URL?,
        primaryColor: Color,
        categorySymbolName: String = "music.note"
    ) {
        self.id = id
        self.title = title
        self.shortTitle = shortTitle
        self.streamUrl = streamUrl
        self.imageURL = imageURL
        self.primaryColor = primaryColor
        self.secondaryColor = primaryColor.opacity(0.8)
        self.categorySymbolName = categorySymbolName
    }
}
