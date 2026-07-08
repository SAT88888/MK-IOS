# MK-IOS Ver.20 Final - Handoff

## Current status

This package is ready for Xcode import/build verification.

## Recommended build route

1. Install Xcode 15 or later.
2. Install XcodeGen if using `project.yml`.
3. From this folder, run:

```bash
xcodegen generate
open MK-IOS.xcodeproj
```

4. Select an iPhone simulator.
5. Build and run.

## If errors appear

Send the full Xcode error text. The remaining work is build-error correction and device testing only.

## Included core modules

- MKAnalyzer
- RiskManager
- PortfolioManager
- ReviewEngine
- DecisionCenter
- StockAnalyzer
- BacktestEngine
- SwiftData entities
- Home / FX / Stock / Journal / Capital / Settings views

## Known placeholders

- Google Drive / Sheets integration is scaffolded, not authenticated.
- Chart image processing is represented by design structure, not full image-rendering implementation.
- App Store assets and signing are not included.
