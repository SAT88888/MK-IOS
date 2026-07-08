import Foundation

enum AssetType: String, Codable, CaseIterable { case fx = "FX", stock = "株式" }
enum TradeDirection: String, Codable, CaseIterable { case buy = "買い", sell = "売り" }
enum TradeResult: String, Codable, CaseIterable { case win = "勝ち", loss = "負け", breakEven = "建値", holding = "保有中" }
enum MKDecision: String, Codable, CaseIterable { case entryOK = "エントリー可", wait = "条件待ち", noEntry = "見送り", reversalWait = "反転待ち", takeProfitFirst = "利確優先", noChase = "追撃禁止" }
enum MarketMode: String, Codable { case aggressive = "攻め", neutral = "通常", defensive = "守り", noTrade = "取引禁止" }

struct TradeRecord: Identifiable, Codable {
    var id = UUID(); var date = Date(); var assetType: AssetType; var symbol: String; var direction: TradeDirection
    var entryPrice: Double; var stopLoss: Double; var takeProfit: Double; var capitalUsed: Double; var leverage: Double
    var reason: String; var result: TradeResult; var profitLoss: Double; var reflection: String; var improvement: String
}
