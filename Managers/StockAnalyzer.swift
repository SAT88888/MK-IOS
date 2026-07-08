import Foundation

struct StockAnalyzerInput {
    let symbol: String
    let name: String
    let price: Double
    let marketCap: Double
    let per: Double
    let dividendYield: Double
    let salesGrowthRate: Double
    let profitGrowthRate: Double
    let volumeChangeRate: Double
    let hasTheme: Bool
    let isBeforeEarnings: Bool
}

final class StockAnalyzer {
    func analyze(input: StockAnalyzerInput) -> StockAnalysisResult {
        var score = 0
        var reasons: [String] = []
        var cautions: [String] = []

        if input.salesGrowthRate >= 0.20 { score += 20; reasons.append("売上成長20%以上") }
        if input.profitGrowthRate >= 0.20 { score += 20; reasons.append("利益成長20%以上") }
        if input.per > 0 && input.per <= 15 { score += 15; reasons.append("PER15倍以下") }
        if input.dividendYield >= 0.03 { score += 15; reasons.append("配当利回り3%以上") }
        if input.marketCap > 0 && input.marketCap <= 50_000_000_000 { score += 10; reasons.append("時価総額500億円以下") }
        if input.volumeChangeRate >= 1.5 { score += 15; reasons.append("出来高1.5倍以上") }
        if input.hasTheme { score += 5; reasons.append("テーマ性あり") }
        if input.isBeforeEarnings { cautions.append("決算前のため無理な新規は避ける") }

        let decision: StockDecision
        if score >= 80 && !input.isBeforeEarnings {
            decision = .buyCandidate
        } else if score >= 65 {
            decision = .watch
        } else if input.volumeChangeRate < 1.5 && score >= 50 {
            decision = .volumeWait
        } else if input.isBeforeEarnings {
            decision = .earningsWait
        } else {
            decision = .noEntry
        }

        return StockAnalysisResult(
            symbol: input.symbol,
            name: input.name,
            totalScore: score,
            decision: decision,
            reasons: reasons,
            cautions: cautions
        )
    }
}
