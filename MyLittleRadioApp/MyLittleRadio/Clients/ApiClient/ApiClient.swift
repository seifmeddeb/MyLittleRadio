// Copyright © Radio France. All rights reserved.

import Dependencies
import DependenciesMacros

@DependencyClient
struct ApiClient: Sendable {

    var fetchStations: @Sendable () async throws -> [Station] = { [] }
}
