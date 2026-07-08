# BUILD CHECK v7

## v7で補強した点
- HomeViewをSwiftData連携版へ更新
- SampleDataServiceを追加し、初回ビルド確認用データを投入可能にした
- JournalListViewのToolbarをToolbarItem形式へ修正
- Settingsを@AppStorage対応に変更

## 優先確認
- `MKIOSApp.swift` の `modelContainer` に全Entityが入っているか
- `SampleDataService.swift` がTarget Membershipに含まれているか
- `TradeRecordEntity`, `ReviewEntity`, `WatchListEntity`, `PortfolioEntity`, `PositionEntity` がSwiftData対象か
- `@Query` を使うViewに `import SwiftData` があるか
- `ScoreBadgeView` と `MKFormatters` がTarget Membershipに含まれているか

## シミュレーター確認手順
1. アプリ起動
2. Home右上の `Seed` を押す
3. Homeに資金状況と監視リストが表示されるか確認
4. Journal > 追加 から記録保存
5. Journalに保存結果が表示されるか確認
6. アプリを再起動して記録が残るか確認

## 既知の未実装
- Google Sheets実API接続
- Google Drive実API接続
- チャート画像への実書き込み
- 本格バックテストUI

## 現在の位置づけ
MVPとして、画面遷移・トレード記録保存・分析結果表示・資金画面・初期データ投入まで確認する段階。
