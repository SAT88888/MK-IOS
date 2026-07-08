import Foundation

struct MKAnalyzerInput { let symbol: String; let timeframe: String; let currentPrice: Double; let ema20: Double; let ema75: Double; let ema200: Double; let boxHigh: Double; let boxLow: Double; let boxMiddleZoneUpper: Double; let boxMiddleZoneLower: Double; let hasBOS: Bool; let hasCHoCH: Bool; let hasFVG: Bool; let isIchimokuBullish: Bool; let spread: Double; let normalSpread: Double; let isImportantNewsTime: Bool }
struct MKAnalyzerOutput { let symbol: String; let direction: TradeDirection?; let totalScore: Int; let decision: MKDecision; let reasons: [String]; let cautions: [String]; let invalidationPoint: Double? }

final class MKAnalyzer {
    func analyze(input: MKAnalyzerInput) -> MKAnalyzerOutput {
        var score = 0; var reasons:[String] = []; var cautions:[String] = []; var direction: TradeDirection? = nil
        if input.isImportantNewsTime { return MKAnalyzerOutput(symbol: input.symbol, direction: nil, totalScore: 0, decision: .noEntry, reasons: reasons, cautions: ["重要指標前後のため新規禁止"], invalidationPoint: nil) }
        if input.spread >= input.normalSpread * 2 { return MKAnalyzerOutput(symbol: input.symbol, direction: nil, totalScore: 0, decision: .noEntry, reasons: reasons, cautions: ["スプレッドが通常の2倍以上"], invalidationPoint: nil) }
        if input.ema20 > input.ema75 && input.ema75 > input.ema200 { direction = .buy; score += 15; reasons.append("EMA上昇順行") }
        else if input.ema20 < input.ema75 && input.ema75 < input.ema200 { direction = .sell; score += 15; reasons.append("EMA下降順行") }
        else { cautions.append("EMA方向不明確") }
        if input.currentPrice >= input.boxMiddleZoneLower && input.currentPrice <= input.boxMiddleZoneUpper { return MKAnalyzerOutput(symbol: input.symbol, direction: direction, totalScore: score, decision: .noEntry, reasons: reasons, cautions: cautions + ["BOX中央帯"], invalidationPoint: nil) }
        if input.hasBOS { score += 15; reasons.append("BOS確認") } else { cautions.append("BOS未確認") }
        if input.hasCHoCH { score += 8; reasons.append("CHoCH発生") }
        if input.hasFVG { score += 10; reasons.append("FVGあり") }
        if input.isIchimokuBullish { score += 10; reasons.append("一目が買い補助") }
        let decision: MKDecision = score >= 80 ? .entryOK : score >= 65 ? .wait : score >= 50 ? .reversalWait : .noEntry
        return MKAnalyzerOutput(symbol: input.symbol, direction: direction, totalScore: score, decision: decision, reasons: reasons, cautions: cautions, invalidationPoint: nil)
    }
}
