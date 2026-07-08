import SwiftUI
import SwiftData

struct JournalAddView: View {
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss

    @State private var symbol = "USDJPY"
    @State private var profitLoss = 0.0
    @State private var reason = ""

    var body: some View {
        Form {
            TextField("銘柄・通貨ペア", text: $symbol)
            TextField("損益", value: $profitLoss, format: .number)
                .keyboardType(.decimalPad)
            TextField("理由", text: $reason, axis: .vertical)
            Button("保存") {
                let trade = TradeRecordEntity(
                    assetType: .fx,
                    symbol: symbol,
                    direction: .buy,
                    entryPrice: 0,
                    stopLoss: 0,
                    takeProfit: 0,
                    capitalUsed: 0,
                    leverage: 1,
                    reason: reason,
                    result: profitLoss >= 0 ? .win : .loss,
                    profitLoss: profitLoss,
                    reflection: "",
                    improvement: ""
                )
                context.insert(trade)
                try? context.save()
                dismiss()
            }
        }
        .navigationTitle("記録追加")
    }
}
