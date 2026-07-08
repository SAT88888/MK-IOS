import Foundation

final class PortfolioManager {
    func calculateState(
        totalCapital: Double,
        cashBalance: Double,
        positions: [OpenPosition],
        realizedProfitLoss: Double,
        monthlyProfitLoss: Double,
        yearlyProfitLoss: Double
    ) -> PortfolioState {
        let unrealized = positions.reduce(0) { $0 + calculateUnrealizedProfitLoss(position: $1) }
        return PortfolioState(
            totalCapital: totalCapital,
            cashBalance: cashBalance,
            realizedProfitLoss: realizedProfitLoss,
            unrealizedProfitLoss: unrealized,
            monthlyProfitLoss: monthlyProfitLoss,
            yearlyProfitLoss: yearlyProfitLoss,
            openPositions: positions
        )
    }

    private func calculateUnrealizedProfitLoss(position: OpenPosition) -> Double {
        let priceDiff: Double = position.direction == .buy
            ? position.currentPrice - position.entryPrice
            : position.entryPrice - position.currentPrice
        return priceDiff * position.quantity * position.leverage
    }
}
