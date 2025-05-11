// Copyright © Radio France. All rights reserved.

import Foundation

@testable import MyLittleRadio

extension Station {
    static func mock(
        id: String = "1",
        title: String = "Test Station",
        streamUrl: String = "https://test.stream",
        imageUrl: String = "https://test.image"
    ) -> Station {
        Station(
            id: id,
            brandId: "brand",
            title: title,
            hasTimeshift: false,
            shortTitle: title,
            type: "musical",
            streamUrl: streamUrl,
            liveRule: "",
            primaryColor: "#FFFFFF",
            isMusical: true,
            imageUrl: imageUrl
        )
    }
}
