// Copyright © Radio France. All rights reserved.

import AVFoundation

final class AudioManager {
    private var player: AVPlayer?

    // Play an audio stream
    func play(_ url: URL?) async throws {
        guard let url else {
            throw AudioManagerError.invalidURL
        }
        
        // Ensure we are running on the main thread
        await MainActor.run {
            self.player = AVPlayer(url: url)
            self.player?.play()
            print("▶️ Audio is playing.")
        }
    }

    // Stop the audio playback
    func stop() async throws {
        await MainActor.run {
            self.player?.pause()
            self.player = nil
            print("⏸️ Audio stopped.")
        }
    }
}

// Custom error for audio manager
enum AudioManagerError: Error {
    case invalidURL
}
