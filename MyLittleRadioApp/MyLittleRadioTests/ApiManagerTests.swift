// Copyright © Radio France. All rights reserved.

import Foundation
import Testing

@testable import MyLittleRadio

@Suite
struct ApiManagerTests {
    
    @Test
    func testFetchStationsReturnsDecodedData() async throws {
        
        // Given
        let stubJSON = """
        {
          "stations": [
            {
                  "id": "7",
                  "brandId": "FIP",
                  "title": "FIP",
                  "hasTimeshift": false,
                  "shortTitle": "Fip",
                  "type": "on_air",
                  "streamUrl": "https://icecast.radiofrance.fr/fip-midfi.mp3",
                  "analytics": {
                    "value": "fip",
                    "stationAudienceId": 7
                  },
                  "liveRule": "apprf_fip_player",
                  "colors": {
                    "primary": "#e2007a"
                  },
                  "assets": {
                    "squareImageUrl": "https://www.radiofrance.fr/s3/cruiser-production/2022/05/a174aea6-c3f3-4a48-a42c-ebc034f62c10/1000x1000_squareimage_fip_v2.jpg"
                  },
                  "isMusical": true
                }
          ]
        }
        """.data(using: .utf8)!

        MockURLProtocol.stubResponseData = stubJSON

        // When
        let config = URLSessionConfiguration.ephemeral
        config.protocolClasses = [MockURLProtocol.self]
        let session = URLSession(configuration: config)

        let manager = ApiManager(session: session)
        let stations = try await manager.fetchStations()

        // Then
        #expect(stations.count == 1)
        #expect(stations.first?.title == "FIP")
    }
}
