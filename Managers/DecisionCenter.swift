import Foundation

final class DecisionCenter {
    func build(
        fxResults: [MKAnalyzerOutput],
        stockResults: [StockAnalysisResult],
        portfolio: PortfolioState,
        dailyLossLimitRate: Double = 0.02
    ) -> DecisionCenterState {
        var warnings: [String] = []
        let dailyLossLimit = portfolio.totalCapital * dailyLossLimitRate
        let marketMode: MarketMode

        if portfolio.realizedProfitLoss <= -dailyLossLimit {
            marketMode = .noTrade
            warnings.append("本日損失上限に到達")
        } else if portfolio.monthlyProfitLoss < -portfolio.totalCapital * 0.05 {
            marketMode = .defensive
            warnings.append("月間損失が5%を超えているため守り優先")
        } else {
            marketMode = .neutral
        }

        let fxPriority = fxResults
            .filter { $0.decision == .entryOK || $0.decision == .wait }
            .sorted { $0.totalScore > $1.totalScore }

        let stockPriority = stockResults
            .filter { $0.decision == .buyCandidate || $0.decision == .watch }
            .sorted { $0.totalScore > $1.totalScore }

        let todayAction: String
        if marketMode == .noTrade {
            todayAction = "本日は新規取引禁止。レビューと監視のみ。"
        } else if let bestFX = fxPriority.first {
            todayAction = "\(bestFX.symbol)を優先監視。条件成立後に再判定。"
        } else if let bestStock = stockPriority.first {
            todayAction = "\(bestStock.symbol)を優先監視。出来高と決算を確認。"
        } else {
            todayAction = "無理に入らず、監視と記録を優先。"
        }

        return DecisionCenterState(
            marketMode: marketMode,
            fxPriority: fxPriority,
            stockPriority: stockPriority,
            riskMessage: "現在の含み損益：\(Int(portfolio.unrealizedProfitLoss))円",
            todayAction: todayAction,
            warnings: warnings
        )
    }
}
