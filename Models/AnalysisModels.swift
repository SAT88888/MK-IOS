import Foundation

struct StockAnalysisResult: Identifiable, Codable {
    var id = UUID()
    var symbol: String
    var name: String
    var totalScore: Int
    var decision: StockDecision
    var reasons: [String]
    var cautions: [String]
}

enum StockDecision: String, Codable, CaseIterable {
    case buyCandidate = "買い候補"
    case watch = "監視"
    case volumeWait = "出来高待ち"
    case earningsWait = "決算待ち"
    case noEntry = "見送り"
}

struct OpenPosition: Identifiable, Codable {
    var id = UUID()
    var assetType: AssetType
    var symbol: String
    var direction: TradeDirection
    var entryPrice: Double
    var currentPrice: Double
    var quantity: Double
    var leverage: Double
    var stopLoss: Double
    var takeProfit: Double
}

struct PortfolioState: Codable {
    var totalCapital: Double
    var cashBalance: Double
    var realizedProfitLoss: Double
    var unrealizedProfitLoss: Double
    var monthlyProfitLoss: Double
    var yearlyProfitLoss: Double
    var openPositions: [OpenPosition]
}

struct ReviewInput {
    let trade: TradeRecord
    let analysis: MKAnalyzerOutput
    let risk: RiskOutput
}

struct ReviewOutput: Codable {
    let score: Int
    let summary: String
    let ruleViolations: [String]
    let goodPoints: [String]
    let improvementPoints: [String]
    let nextAction: String
}

struct DecisionCenterState {
    let marketMode: MarketMode
    let fxPriority: [MKAnalyzerOutput]
    let stockPriority: [StockAnalysisResult]
    let riskMessage: String
    let todayAction: String
    let warnings: [String]
}
