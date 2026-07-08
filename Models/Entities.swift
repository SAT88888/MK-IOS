import Foundation
import SwiftData

@Model final class TradeRecordEntity: Identifiable {
    @Attribute(.unique) var id: UUID
    var date: Date
    var assetTypeRaw: String
    var symbol: String
    var directionRaw: String
    var entryPrice: Double
    var stopLoss: Double
    var takeProfit: Double
    var capitalUsed: Double
    var leverage: Double
    var reason: String
    var resultRaw: String
    var profitLoss: Double
    var reflection: String
    var improvement: String

    var assetType: AssetType { AssetType(rawValue: assetTypeRaw) ?? .fx }
    var direction: TradeDirection { TradeDirection(rawValue: directionRaw) ?? .buy }
    var result: TradeResult { TradeResult(rawValue: resultRaw) ?? .holding }

    init(
        id: UUID = UUID(),
        date: Date = Date(),
        assetType: AssetType,
        symbol: String,
        direction: TradeDirection,
        entryPrice: Double,
        stopLoss: Double,
        takeProfit: Double,
        capitalUsed: Double,
        leverage: Double,
        reason: String,
        result: TradeResult,
        profitLoss: Double,
        reflection: String,
        improvement: String
    ) {
        self.id = id
        self.date = date
        self.assetTypeRaw = assetType.rawValue
        self.symbol = symbol
        self.directionRaw = direction.rawValue
        self.entryPrice = entryPrice
        self.stopLoss = stopLoss
        self.takeProfit = takeProfit
        self.capitalUsed = capitalUsed
        self.leverage = leverage
        self.reason = reason
        self.resultRaw = result.rawValue
        self.profitLoss = profitLoss
        self.reflection = reflection
        self.improvement = improvement
    }
}

@Model final class ReviewEntity: Identifiable {
    @Attribute(.unique) var id: UUID
    var tradeId: UUID
    var date: Date
    var score: Int
    var summary: String
    var ruleViolationsText: String
    var goodPointsText: String
    var improvementPointsText: String
    var nextAction: String

    init(
        id: UUID = UUID(),
        tradeId: UUID,
        date: Date = Date(),
        score: Int,
        summary: String,
        ruleViolations: [String],
        goodPoints: [String],
        improvementPoints: [String],
        nextAction: String
    ) {
        self.id = id
        self.tradeId = tradeId
        self.date = date
        self.score = score
        self.summary = summary
        self.ruleViolationsText = ruleViolations.joined(separator: "\n")
        self.goodPointsText = goodPoints.joined(separator: "\n")
        self.improvementPointsText = improvementPoints.joined(separator: "\n")
        self.nextAction = nextAction
    }
}

@Model final class WatchListEntity: Identifiable {
    @Attribute(.unique) var id: UUID
    var symbol: String
    var name: String
    var assetTypeRaw: String
    var memo: String
    var isActive: Bool
    var createdAt: Date

    var assetType: AssetType { AssetType(rawValue: assetTypeRaw) ?? .stock }

    init(
        id: UUID = UUID(),
        symbol: String,
        name: String,
        assetType: AssetType,
        memo: String = "",
        isActive: Bool = true,
        createdAt: Date = Date()
    ) {
        self.id = id
        self.symbol = symbol
        self.name = name
        self.assetTypeRaw = assetType.rawValue
        self.memo = memo
        self.isActive = isActive
        self.createdAt = createdAt
    }
}

@Model final class PortfolioEntity: Identifiable {
    @Attribute(.unique) var id: UUID
    var totalCapital: Double
    var cashBalance: Double
    var realizedProfitLoss: Double
    var unrealizedProfitLoss: Double
    var monthlyProfitLoss: Double
    var yearlyProfitLoss: Double
    var updatedAt: Date

    init(
        id: UUID = UUID(),
        totalCapital: Double,
        cashBalance: Double,
        realizedProfitLoss: Double = 0,
        unrealizedProfitLoss: Double = 0,
        monthlyProfitLoss: Double = 0,
        yearlyProfitLoss: Double = 0,
        updatedAt: Date = Date()
    ) {
        self.id = id
        self.totalCapital = totalCapital
        self.cashBalance = cashBalance
        self.realizedProfitLoss = realizedProfitLoss
        self.unrealizedProfitLoss = unrealizedProfitLoss
        self.monthlyProfitLoss = monthlyProfitLoss
        self.yearlyProfitLoss = yearlyProfitLoss
        self.updatedAt = updatedAt
    }
}

@Model final class PositionEntity: Identifiable {
    @Attribute(.unique) var id: UUID
    var assetTypeRaw: String
    var symbol: String
    var directionRaw: String
    var entryPrice: Double
    var currentPrice: Double
    var quantity: Double
    var leverage: Double
    var stopLoss: Double
    var takeProfit: Double
    var openedAt: Date

    init(
        id: UUID = UUID(),
        assetType: AssetType,
        symbol: String,
        direction: TradeDirection,
        entryPrice: Double,
        currentPrice: Double,
        quantity: Double,
        leverage: Double,
        stopLoss: Double,
        takeProfit: Double,
        openedAt: Date = Date()
    ) {
        self.id = id
        self.assetTypeRaw = assetType.rawValue
        self.symbol = symbol
        self.directionRaw = direction.rawValue
        self.entryPrice = entryPrice
        self.currentPrice = currentPrice
        self.quantity = quantity
        self.leverage = leverage
        self.stopLoss = stopLoss
        self.takeProfit = takeProfit
        self.openedAt = openedAt
    }
}
