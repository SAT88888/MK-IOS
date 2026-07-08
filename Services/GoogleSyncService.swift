import Foundation

/// MVPでは手動同期の設計枠だけ用意。実API接続はGoogle認証設定後に実装。
final class GoogleSyncService {
    enum SyncStatus: String {
        case idle = "待機"
        case syncing = "同期中"
        case success = "同期完了"
        case failed = "同期失敗"
    }

    private(set) var status: SyncStatus = .idle

    func exportTradesToSheetPlaceholder() {
        status = .syncing
        // TODO: Google Sheets API認証後、TradeRecordEntityを行データへ変換して送信
        status = .success
    }

    func importCSVFromDrivePlaceholder() {
        status = .syncing
        // TODO: Google Drive API認証後、CSVを取得して解析データへ変換
        status = .success
    }
}
