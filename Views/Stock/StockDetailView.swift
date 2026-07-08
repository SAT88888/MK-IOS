import SwiftUI

struct StockDetailView: View {
    let result: StockAnalysisResult

    var body: some View {
        List {
            Section("総合判定") {
                Text(result.name)
                Text("判定：\(result.decision.rawValue)")
                ScoreBadgeView(score: result.totalScore, label: "score")
            }
            Section("根拠") {
                ForEach(result.reasons, id: \.self) { Text($0) }
            }
            Section("注意") {
                if result.cautions.isEmpty { Text("大きな注意なし") }
                else { ForEach(result.cautions, id: \.self) { Text($0) } }
            }
        }
        .navigationTitle(result.symbol)
    }
}
