import SwiftUI
import SwiftData

struct JournalListView: View {
    @Query(sort: \TradeRecordEntity.date, order: .reverse) private var trades: [TradeRecordEntity]

    var body: some View {
        NavigationStack {
            List {
                if trades.isEmpty {
                    ContentUnavailableView("記録なし", systemImage: "book", description: Text("右上の追加からトレードを記録します。"))
                } else {
                    ForEach(trades) { trade in
                        VStack(alignment: .leading, spacing: 6) {
                            HStack {
                                Text(trade.symbol).font(.headline)
                                Spacer()
                                Text(MKFormatters.yen(trade.profitLoss))
                                    .foregroundStyle(trade.profitLoss < 0 ? .red : .primary)
                            }
                            Text(trade.reason.isEmpty ? "理由未記入" : trade.reason)
                                .font(.caption)
                                .foregroundStyle(.secondary)
                        }
                    }
                }
            }
            .navigationTitle("Journal")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink {
                        JournalAddView()
                    } label: {
                        Label("追加", systemImage: "plus")
                    }
                }
            }
        }
    }
}
