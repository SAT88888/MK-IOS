import Foundation

struct BacktestSummary: Codable {
    let tradeCount: Int
    let winCount: Int
    let lossCount: Int
    let totalProfitLoss: Double
    let winRate: Double
    let averageProfitLoss: Double
    let improvementHint: String
}

final class BacktestEngine {
    func summarize(trades: [TradeRecord]) -> BacktestSummary {
        let count = trades.count
        let wins = trades.filter { $0.profitLoss > 0 }.count
        let losses = trades.filter { $0.profitLoss < 0 }.count
        let total = trades.reduce(0) { $0 + $1.profitLoss }
        let winRate = count == 0 ? 0 : Double(wins) / Double(count)
        let average = count == 0 ? 0 : total / Double(count)

        let hint: String
        if count == 0 {
            hint = "まずは記録を蓄積する"
        } else if winRate < 0.5 {
            hint = "勝率が低いため、エントリー条件と見送り基準を強化"
        } else if average < 0 {
            hint = "平均損益がマイナス。損切幅と利確位置を再確認"
        } else {
            hint = "現行ルールを継続し、負けパターンのみ改善"
        }

        return BacktestSummary(
            tradeCount: count,
            winCount: wins,
            lossCount: losses,
            totalProfitLoss: total,
            winRate: winRate,
            averageProfitLoss: average,
            improvementHint: hint
        )
    }
}
