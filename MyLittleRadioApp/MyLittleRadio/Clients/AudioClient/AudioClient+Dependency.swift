// Copyright © Radio France. All rights reserved.

import Dependencies

extension DependencyValues {
    var audioClient: AudioClient {
        get { self[AudioClient.self] }
        set { self[AudioClient.self] = newValue }
    }
}

extension AudioClient: DependencyKey {
    
    private static let shared = AudioManager()
    
    public static let liveValue: Self = {
        
        return Self(
            play: { url in
                try await shared.play(url)
            },
            stop: {
                try await shared.stop()
            }
        )
    }()
}

extension AudioClient: TestDependencyKey {

    public static let previewValue = Self()
    public static let testValue = Self()
}
