import Foundation

final class ReviewEngine {
    func review(input: ReviewInput) -> ReviewOutput {
        var score = 100
        var violations: [String] = []
        var good: [String] = []
        var improvements: [String] = []

        if input.analysis.decision != .entryOK {
            score -= 25
            violations.append("分析判定がエントリー可ではない状態で取引")
        } else {
            good.append("分析判定に沿って取引できている")
        }

        if !input.risk.isTradeAllowed {
            score -= 30
            violations.append("資金管理判定が禁止状態")
        } else {
            good.append("資金管理ルールを守れている")
        }

        if input.trade.reason.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            score -= 15
            violations.append("エントリー理由が未記入")
            improvements.append("次回はエントリー前に理由を記録する")
        }

        if input.trade.reflection.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            score -= 10
            improvements.append("トレード後の反省を記録する")
        }

        if input.risk.riskRewardRatio < 1.5 {
            score -= 20
            violations.append("リスクリワードが1:1.5未満")
        }

        let fixedScore = max(score, 0)
        let summary: String
        switch fixedScore {
        case 85...100: summary = "非常に良いトレード。ルール遵守度が高い。"
        case 70..<85: summary = "概ね良いが、一部改善余地あり。"
        case 50..<70: summary = "判断に甘さあり。次回は条件確認を強化。"
        default: summary = "ルール違反が多い。次回は見送り判断を優先。"
        }

        return ReviewOutput(
            score: fixedScore,
            summary: summary,
            ruleViolations: violations,
            goodPoints: good,
            improvementPoints: improvements,
            nextAction: improvements.first ?? "同じ基準で継続"
        )
    }
}
