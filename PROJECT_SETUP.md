# Xcode導入手順

1. Xcodeで新規プロジェクトを作成
   - iOS > App
   - Product Name: MKIOS
   - Interface: SwiftUI
   - Language: Swift
   - Minimum iOS: 17.0以上推奨

2. このZIP内のフォルダをXcodeプロジェクトへ追加
   - App
   - Models
   - Managers
   - Stores
   - Views
   - Services
   - Utilities

3. 既存の `ContentView.swift` と初期Appファイルは削除または未使用にする

4. `MKIOSApp.swift` が `@main` になっていることを確認

5. Build SettingsでiOS 17以上になっていることを確認

6. まずシミュレーターでビルド

7. SwiftDataの初期化エラーが出る場合
   - アプリを一度削除
   - Clean Build Folder
   - 再ビルド

## 注意
Google同期はまだプレースホルダーです。Google API認証情報を入れるまでは実通信しません。
