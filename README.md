# MK-IOS Codemagic Ready

Codemagicで **App Store提出なし / 署名なし / iOS Simulatorビルド確認** をするための構成です。

## GitHubにアップするもの

このフォルダの中身をそのままGitHubリポジトリ直下に置いてください。

```text
App/
project.yml
codemagic.yaml
README.md
```

## Codemagicでの流れ

1. GitHubへこの中身をアップロード
2. Codemagicで Add application
3. GitHubリポジトリを選択
4. Workflow: `ios-simulator-build`
5. Start new build

## 重要

これはシミュレータービルド確認用です。
Apple Developer Program、証明書、App Store Connect、TestFlight設定は不要です。

## 既存MK-IOS本体に入れる場合

既存のMK-IOSフォルダに `codemagic.yaml` を追加し、`project.yml` がリポジトリ直下にある状態にしてください。
