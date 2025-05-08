// Copyright © Radio France. All rights reserved.

import Foundation
import SwiftUI

struct StationViewModel: Equatable, Hashable, Identifiable {
    
    let id: String
    let title: String
    let streamUrl: URL?
    let imageURL: URL?
    let primaryColor: Color
    
    // MARK: - Init
    
    init(from station: Station) {
        self.id = station.id
        self.title = station.title
        self.streamUrl = URL(string: station.streamUrl)
        self.imageURL = URL(string: station.imageUrl)
        self.primaryColor = Color(hex: station.primaryColor) ?? .blue
    }
    
    init(
        id: String,
        title: String,
        streamUrl: URL?,
        imageURL: URL?,
        primaryColor: Color
    ) {
        self.id = id
        self.title = title
        self.streamUrl = streamUrl
        self.imageURL = imageURL
        self.primaryColor = primaryColor
    }
}
