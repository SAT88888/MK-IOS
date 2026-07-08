import Foundation

extension TradeRecordEntity {
    func toTradeRecord() -> TradeRecord {
        TradeRecord(
            id: id,
            date: date,
            assetType: assetType,
            symbol: symbol,
            direction: direction,
            entryPrice: entryPrice,
            stopLoss: stopLoss,
            takeProfit: takeProfit,
            capitalUsed: capitalUsed,
            leverage: leverage,
            reason: reason,
            result: result,
            profitLoss: profitLoss,
            reflection: reflection,
            improvement: improvement
        )
    }
}

extension PositionEntity {
    var assetType: AssetType { AssetType(rawValue: assetTypeRaw) ?? .fx }
    var direction: TradeDirection { TradeDirection(rawValue: directionRaw) ?? .buy }

    func toOpenPosition() -> OpenPosition {
        OpenPosition(
            id: id,
            assetType: assetType,
            symbol: symbol,
            direction: direction,
            entryPrice: entryPrice,
            currentPrice: currentPrice,
            quantity: quantity,
            leverage: leverage,
            stopLoss: stopLoss,
            takeProfit: takeProfit
        )
    }
}
