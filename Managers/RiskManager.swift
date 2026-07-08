import Foundation

struct RiskInput { let totalCapital: Double; let dailyProfitLoss: Double; let monthlyProfitLoss: Double; let consecutiveLosses: Int; let entryPrice: Double; let stopLossPrice: Double; let takeProfitPrice: Double; let plannedCapitalRatio: Double; let leverage: Double; let hasBoxEdgeReaction: Bool; let hasBOSConfirmation: Bool; let hasClearInvalidation: Bool }
struct RiskOutput { let isTradeAllowed: Bool; let capitalToUse: Double; let positionValue: Double; let maxLossAmount: Double; let maxLossRate: Double; let riskRewardRatio: Double; let nextCapitalRatio: Double; let cautions: [String] }

final class RiskManager {
    func evaluate(input: RiskInput) -> RiskOutput {
        var cautions:[String] = []; let dailyLossLimit = input.totalCapital * 0.02
        if input.dailyProfitLoss <= -dailyLossLimit { cautions.append("本日損失2%到達"); return denied(input, cautions) }
        if !input.hasClearInvalidation { cautions.append("否定ライン不明確"); return denied(input, cautions) }
        if !input.hasBoxEdgeReaction { cautions.append("BOX端反応なし"); return denied(input, cautions) }
        if !input.hasBOSConfirmation { cautions.append("BOS未確認"); return denied(input, cautions) }
        let stopDistance = abs(input.entryPrice - input.stopLossPrice); let rewardDistance = abs(input.takeProfitPrice - input.entryPrice)
        if stopDistance == 0 { cautions.append("損切幅0"); return denied(input, cautions) }
        let rr = rewardDistance / stopDistance
        if rr < 1.5 { cautions.append("RR 1:1.5未満"); return denied(input, cautions) }
        let capitalToUse = input.totalCapital * input.plannedCapitalRatio; let positionValue = capitalToUse * input.leverage; let maxLossRate = stopDistance / input.entryPrice; let maxLossAmount = positionValue * maxLossRate
        if maxLossAmount > input.totalCapital * 0.02 { cautions.append("想定損失2%超"); return denied(input, cautions) }
        return RiskOutput(isTradeAllowed: true, capitalToUse: capitalToUse, positionValue: positionValue, maxLossAmount: maxLossAmount, maxLossRate: maxLossRate, riskRewardRatio: rr, nextCapitalRatio: nextRatio(input.consecutiveLosses), cautions: cautions)
    }
    private func denied(_ input: RiskInput, _ cautions:[String]) -> RiskOutput { RiskOutput(isTradeAllowed: false, capitalToUse: 0, positionValue: 0, maxLossAmount: 0, maxLossRate: 0, riskRewardRatio: 0, nextCapitalRatio: nextRatio(input.consecutiveLosses), cautions: cautions) }
    private func nextRatio(_ losses: Int) -> Double { [0.03,0.06,0.09,0.12,0.15][min(max(losses,0),4)] }
}
