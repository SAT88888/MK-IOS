import Foundation
import SwiftData

final class TradeRecordStore {
    private let context: ModelContext

    init(context: ModelContext) {
        self.context = context
    }

    func add(_ trade: TradeRecordEntity) throws {
        context.insert(trade)
        try context.save()
    }

    func delete(_ trade: TradeRecordEntity) throws {
        context.delete(trade)
        try context.save()
    }

    func save() throws {
        try context.save()
    }
}
