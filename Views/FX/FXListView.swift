import SwiftUI

struct FXListView: View {
    private let sampleResults: [MKAnalyzerOutput] = [
        MKAnalyzerOutput(symbol: "USDJPY", direction: .buy, totalScore: 74, decision: .wait, reasons: ["EMA上昇順行", "FVGあり"], cautions: ["BOS未確認"], invalidationPoint: nil),
        MKAnalyzerOutput(symbol: "EURJPY", direction: nil, totalScore: 42, decision: .noEntry, reasons: [], cautions: ["BOX中央帯"], invalidationPoint: nil)
    ]

    var body: some View {
        NavigationStack {
            List(sampleResults, id: \.symbol) { result in
                NavigationLink {
                    FXDetailView(result: result)
                } label: {
                    VStack(alignment: .leading, spacing: 4) {
                        Text(result.symbol).font(.headline)
                        Text("\(result.decision.rawValue) / \(result.totalScore)点")
                            .font(.caption)
                            .foregroundStyle(.secondary)
                    }
                }
            }
            .navigationTitle("FX")
        }
    }
}
