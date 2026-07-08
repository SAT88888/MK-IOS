# MK-IOS Ver.20 Final - Xcode Build Request

## 現在の正確な状態

- 設計・仕様：完了
- Swiftファイル一式：作成済み
- XcodeGen `project.yml`：作成済み
- SwiftDataモデル：作成済み
- 最低限の画面導線：作成済み
- Google同期：プレースホルダー段階
- 実機ビルド：未確認

## 次に必要な作業

1. v13 ZIPをMacで展開
2. ターミナルで展開フォルダへ移動
3. `xcodegen generate` を実行
4. 生成された `MK-IOS.xcodeproj` をXcodeで開く
5. iPhone Simulator または実機でBuild
6. エラーが出た場合は、エラー全文をChatGPTへ貼り付ける

## 重要

この段階から先は、Xcodeの実ビルドログがないと正確な最終修正はできません。
ChatGPT側でできる静的チェック・構成整理は完了済みです。
