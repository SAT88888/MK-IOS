# Xcode Build Log Template

Xcodeでビルドした後、エラー修正に必要な情報をここに貼る。

## 1. 環境

- Xcode version:
- macOS version:
- iOS Deployment Target:
- 実機 or Simulator:

## 2. 実行手順

1. `xcodegen generate`
2. `MK-IOS.xcodeproj` を開く
3. Product > Clean Build Folder
4. Product > Build

## 3. 貼ってほしいエラー

以下をそのまま貼る。

```text
Build failed エラー本文
```

## 4. 特に重要なエラー種類

- Cannot find type ... in scope
- No such module ...
- SwiftData model container error
- Info.plist related error
- Signing & Capabilities error
- iOS deployment target error

## 5. 修正方針

エラーが出たら、該当ファイル単位で修正し、次版ZIPとして返す。
