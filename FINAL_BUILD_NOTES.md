# MK-IOS Ver.20 Final v10 - Final Build Notes

## Status
- Spec / architecture: completed
- Local SwiftData MVP: included
- XcodeGen project definition: included
- Google sync: placeholder service only; real OAuth/API credentials are not included

## Recommended build flow
1. Install Xcode 15 or later.
2. Install XcodeGen if using `project.yml`.
3. From this folder, run:
   ```bash
   xcodegen generate
   open MK-IOS.xcodeproj
   ```
4. Select an iPhone Simulator.
5. Build and run.
6. Tap `Seed` on Home to insert sample data.

## Expected first-run behavior
- App launches to tab view.
- Home shows MK-IOS dashboard.
- Seed button creates a sample portfolio and watch list.
- Journal tab allows adding a simple trade record.
- Capital tab shows portfolio and positions.

## Known remaining work
- Connect real Google Drive / Sheets authentication.
- Connect live market data or imported CSV parser.
- Run real Xcode build and fix any environment-specific errors.
- Add App Store signing team and app icon.
