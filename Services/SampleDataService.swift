import Foundation
import SwiftData

/// 初回ビルド確認用のサンプルデータ投入サービス。
/// 本番運用では使わず、Xcode上で画面表示とSwiftData保存を確認するための補助。
@MainActor
final class SampleDataService {
    static func seedIfNeeded(context: ModelContext) {
        let portfolioDescriptor = FetchDescriptor<PortfolioEntity>()
        let existingPortfolios = (try? context.fetch(portfolioDescriptor)) ?? []

        if existingPortfolios.isEmpty {
            context.insert(
                PortfolioEntity(
                    totalCapital: 3_500_000,
                    cashBalance: 3_500_000,
                    realizedProfitLoss: 0,
                    unrealizedProfitLoss: 0,
                    monthlyProfitLoss: 0,
                    yearlyProfitLoss: 0
                )
            )
        }

        let watchDescriptor = FetchDescriptor<WatchListEntity>()
        let existingWatchList = (try? context.fetch(watchDescriptor)) ?? []

        if existingWatchList.isEmpty {
            context.insert(WatchListEntity(symbol: "USDJPY", name: "米ドル円", assetType: .fx, memo: "MK FX優先監視"))
            context.insert(WatchListEntity(symbol: "EURJPY", name: "ユーロ円", assetType: .fx, memo: "欧州時間に監視"))
            context.insert(WatchListEntity(symbol: "0000", name: "監視銘柄サンプル", assetType: .stock, memo: "出来高急増候補"))
        }

        try? context.save()
    }
}
