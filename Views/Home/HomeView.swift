import SwiftUI
import SwiftData

struct HomeView: View {
    @Environment(\.modelContext) private var context
    @Query(sort: \PortfolioEntity.updatedAt, order: .reverse) private var portfolios: [PortfolioEntity]
    @Query(sort: \WatchListEntity.createdAt, order: .reverse) private var watchList: [WatchListEntity]
    @Query(sort: \TradeRecordEntity.date, order: .reverse) private var trades: [TradeRecordEntity]

    private var latestPortfolio: PortfolioEntity? { portfolios.first }

    private var monthlyProfitLoss: Double {
        latestPortfolio?.monthlyProfitLoss ?? trades.reduce(0) { $0 + $1.profitLoss }
    }

    var body: some View {
        NavigationStack {
            List {
                Section("Decision Center") {
                    Text(todayAction)
                        .font(.headline)
                    Text("市場モード：\(marketMode)")
                    Text("月間損益：\(MKFormatters.yen(monthlyProfitLoss))")
                        .foregroundStyle(monthlyProfitLoss < 0 ? .red : .primary)
                }

                Section("資金状況") {
                    Text("総資金：\(MKFormatters.yen(latestPortfolio?.totalCapital ?? 0))")
                    Text("現金残高：\(MKFormatters.yen(latestPortfolio?.cashBalance ?? 0))")
                    Text("実現損益：\(MKFormatters.yen(latestPortfolio?.realizedProfitLoss ?? 0))")
                }

                Section("優先監視") {
                    if watchList.isEmpty {
                        Text("監視リスト未登録")
                            .foregroundStyle(.secondary)
                    } else {
                        ForEach(watchList.prefix(5)) { item in
                            VStack(alignment: .leading, spacing: 4) {
                                Text(item.name).font(.headline)
                                Text("\(item.symbol) / \(item.assetType.rawValue)")
                                    .font(.caption)
                                    .foregroundStyle(.secondary)
                            }
                        }
                    }
                }
            }
            .navigationTitle("MK-IOS")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Seed") {
                        SampleDataService.seedIfNeeded(context: context)
                    }
                }
            }
        }
    }

    private var marketMode: String {
        guard let portfolio = latestPortfolio else { return MarketMode.neutral.rawValue }
        if portfolio.realizedProfitLoss <= -(portfolio.totalCapital * 0.02) { return MarketMode.noTrade.rawValue }
        if portfolio.monthlyProfitLoss < -(portfolio.totalCapital * 0.05) { return MarketMode.defensive.rawValue }
        return MarketMode.neutral.rawValue
    }

    private var todayAction: String {
        guard let portfolio = latestPortfolio else { return "まずはSeedまたは資金設定を行う。" }
        if portfolio.realizedProfitLoss <= -(portfolio.totalCapital * 0.02) {
            return "本日は新規取引禁止。レビューと監視のみ。"
        }
        if monthlyProfitLoss < -(portfolio.totalCapital * 0.05) {
            return "守り優先。ロットを落として検証中心。"
        }
        return "条件成立まで待機。無理に入らない。"
    }
}
