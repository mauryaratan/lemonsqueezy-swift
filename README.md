# LemonSqueezy

An asynchronous Swift library for the Lemon Squeezy API.

## Quick Start Guide

New `LemonSqueezy` instance must be initiated with Lemon Squeezy [API Key](https://app.lemonsqueezy.com/settings/api). You may check [Example app](https://github.com/mauryaratan/lemonsqueezy-ios-app) as a quickstart guide.

```swift
import LemonSqueezy

@main
struct Lemon_SqueezyApp: App {
    @StateObject var lemon = LemonSqueezy(LS_API_KEY)
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(lemon)
        }
    }
}

// Then use in any file by importing the following
@EnvironmentObject var lemon: LemonSqueezy
```

## Documentation

You can find the full documentation in [this repo's Wiki](https://github.com/mauryaratan/lemonsqueezy-swift/wiki) (auto-generated by [SwiftDoc](https://github.com/SwiftDoc/swift-doc)).
