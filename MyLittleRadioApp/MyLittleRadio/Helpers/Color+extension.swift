import SwiftUI

extension Color {
    init?(hex: String) {
        guard hex.hasPrefix("#") else { return nil }

        let hexString = String(hex.dropFirst())
        guard hexString.count == 6,
              let int = Int(hexString, radix: 16) else {
            return nil
        }

        let r = Double((int >> 16) & 0xFF) / 255.0
        let g = Double((int >> 8) & 0xFF) / 255.0
        let b = Double(int & 0xFF) / 255.0

        self.init(red: r, green: g, blue: b)
    }
}
