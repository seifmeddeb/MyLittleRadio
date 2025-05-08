// Copyright © Radio France. All rights reserved.

import Foundation
import Dependencies
import DependenciesMacros

@DependencyClient
struct AudioClient {
    var play: @Sendable (URL?) async throws -> Void
    var stop: @Sendable () async throws -> Void
}
