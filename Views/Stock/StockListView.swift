import SwiftUI

struct StockListView: View {
    private let sampleResults: [StockAnalysisResult] = [
        StockAnalysisResult(symbol: "0000", name: "監視銘柄サンプル", totalScore: 68, decision: .watch, reasons: ["PER15倍以下", "出来高増加"], cautions: [])
    ]

    var body: some View {
        NavigationStack {
            List(sampleResults) { result in
                NavigationLink {
                    StockDetailView(result: result)
                } label: {
                    VStack(alignment: .leading, spacing: 4) {
                        Text(result.name).font(.headline)
                        Text("\(result.symbol) / \(result.decision.rawValue) / \(result.totalScore)点")
                            .font(.caption)
                            .foregroundStyle(.secondary)
                    }
                }
            }
            .navigationTitle("Stock")
        }
    }
}
