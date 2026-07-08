# MK-IOS Ver.20 Final Preflight Checklist

## Xcode設定
- iOS Deployment Target: 17.0以上
- SwiftUI / SwiftData 有効
- `MKIOSApp.swift` の `@main` が1つだけ存在すること
- 初期生成された `ContentView.swift` と既存Appファイルは削除またはTarget Membershipを外すこと

## Target Membership
以下フォルダ内の `.swift` をすべてアプリTargetへ追加する。
- App
- Models
- Managers
- Stores
- Services
- Utilities
- Views

## 初回起動確認
1. ビルド
2. Home画面を開く
3. 右上 `Seed` を押す
4. Capitalに総資金が表示される
5. Journalで記録追加できる
6. FX / Stock詳細に遷移できる

## 既知の未実装
- Google Sheets実API認証
- Google Drive実CSV取得
- 実チャート画像への自動描画
- 実レート/株価API接続

## 次の実作業
Xcodeでビルドし、表示されたエラー文をそのまま修正対象にする。
