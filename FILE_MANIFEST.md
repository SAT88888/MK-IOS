# MK-IOS File Manifest v9

## App
- `MKIOSApp.swift`: SwiftData modelContainerを設定するエントリーポイント
- `RootView.swift`: Home / FX / Stock / Journal / Capital / Settings のTab構成

## Models
- `CoreModels.swift`: 共通enumとTradeRecord
- `AnalysisModels.swift`: 分析・レビュー・意思決定用モデル
- `Entities.swift`: SwiftData保存用Entity
- `EntityExtensions.swift`: Entityから通常モデルへの変換

## Managers
- `MKAnalyzer.swift`: FX判定エンジン
- `RiskManager.swift`: 資金管理・RR・禁止判定
- `PortfolioManager.swift`: 資産状態計算
- `DecisionCenter.swift`: 今日の行動判定
- `ReviewEngine.swift`: トレード後レビュー
- `StockAnalyzer.swift`: 株式スクリーニング判定
- `BacktestEngine.swift`: 勝率・平均損益の要約

## Stores / Services / Utilities
- `TradeRecordStore.swift`: SwiftData保存処理
- `SampleDataService.swift`: 初回動作確認用Seed
- `GoogleSyncService.swift`: Google同期の拡張プレースホルダー
- `Formatters.swift`: 円・%表示

## Views
- Home / FX / Stock / Journal / Capital / Settings / Components

## Build helper
- `project.yml`: XcodeGen用プロジェクト定義。XcodeGenを使う場合はこのファイルから `.xcodeproj` を生成可能。
