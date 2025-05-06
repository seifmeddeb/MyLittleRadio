// Copyright © Radio France. All rights reserved.

import Foundation

struct StationViewModel: Equatable, Identifiable {
    let id: String
    let title: String
}

extension StationViewModel {
    init(from station: Station) {
        self.id = station.id
        self.title = station.title
    }
}
