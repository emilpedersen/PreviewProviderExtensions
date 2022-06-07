import SwiftUI

public struct PreviewProviderExtensions {
    public private(set) var text = "Hello, World!"

    public init() {
    }
}

@available(iOS 13.0, *)
struct ScreenPreview<Screen: View>: View {
    var screen: Screen

    var body: some View {
        ForEach(deviceNames, id: \.self) { device in
            ForEach([ColorScheme.dark, ColorScheme.light], id: \.self) { scheme in
                self.screen
                    .previewDevice(PreviewDevice(rawValue: device))
                    .colorScheme(scheme)
                    .previewDisplayName("\(scheme.name): \(device)")
            }
        }
    }

    private var deviceNames: [String] {
        [
            "iPhone 13 Pro",
            "iPhone 8",
            "iPhone 8 Plus",
            "iPhone 13 Pro Max",
            "iPad Pro (9.7-inch)"
        ]
    }
}

@available(iOS 13.0, *)
extension ColorScheme {
    var name: String {
        String(describing: self).capitalized
    }
}

@available(iOS 13.0, *)
extension View {
    func previewAsScreen() -> some View {
        ScreenPreview(screen: self)
    }
}
