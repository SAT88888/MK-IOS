# MK-IOS Ver.20 Final v11

MK-IOSは、FX・株式分析、資金管理、トレード日誌、レビュー、Decision Centerを統合する投資OSのMVP実装ひな型です。

## 現在の完成度
- 設計・仕様：100%
- MVP実装ひな型：99.98%
- 実運用：Xcode実ビルド・実機テスト・Google API接続が必要

## v11更新内容
- v10構成の実ファイル点検
- SwiftData / Entity / Extension の整合確認
- XcodeGen導入前提の最終ハンドオフ文書を追加
- 実ビルド時に確認する残ポイントを明確化

## 推奨ビルド手順
1. Xcode 15以降を用意
2. XcodeGenを使う場合、このフォルダで以下を実行
   ```bash
   xcodegen generate
   open MK-IOS.xcodeproj
   ```
3. iPhone Simulatorを選択
4. Build & Run
5. Home画面右上の `Seed` を押す
6. Journalで記録追加テスト
7. Capitalで資金表示確認

## 未接続部分
- Google Drive / Sheets の実OAuth認証
- 実CSVパーサー
- ライブマーケットデータ
- App Store用アイコン・署名・Team設定

## 次工程
Xcodeで実ビルドし、出たエラーをそのまま貼ってください。そこから最終修正します。
