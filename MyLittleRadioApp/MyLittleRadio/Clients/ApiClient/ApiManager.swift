// Copyright © Radio France. All rights reserved.

import Foundation

final class ApiManager {

    func fetchStations() async -> [Station] {
        let mockedData = [
            Station(
                id: "1",
                title: "Radio 1"
            ),
            Station(
                id: "2",
                title: "Radio 2"
            ),
            Station(
                id: "3",
                title: "Radio 3"
            )
        ]
        return mockedData
    }
}
