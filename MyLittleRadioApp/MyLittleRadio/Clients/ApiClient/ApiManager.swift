// Copyright © Radio France. All rights reserved.

import Foundation

final class ApiManager {

    func fetchStations() async throws -> [Station] {
        guard let url = URL(string: ApiEndpoints.stations.url) else { return [] }
        let (data, _) = try await URLSession.shared.data(from: url)
        let decoded = try JSONDecoder().decode(StationListResponse.self, from: data)
        return decoded.stations.map { Station(from: $0) }
    }
    
    enum ApiEndpoints {
        
        case stations
        
        var url: String {
            switch self {
            case .stations:
                "http://localhost:3000/stations"
            }
        }
    }
    
}
